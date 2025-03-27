import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
//import 'package:voltsense2/data/devices/device_controller/device_controller.dart';
import 'package:voltsense2/data/devices/device_model/device_model.dart';
import 'package:voltsense2/utils/constants/loaders.dart';

class DeviceController extends GetxController {
  static DeviceController get instance => Get.find();

  Rx<DeviceModel> device = DeviceModel(
    deviceId: '',
    voltage: 0.0,
    current: 0.0,
    power: 0.0,
    status: 'off',
    devInsights: '',
    lastUpdated: '',
  ).obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    print('DeviceController initialized');
    fetchDeviceData();
    fetchDeviceAnomaly();
    fetchDeviceInsights();
    calculateTotalPowerStream();
  }

  // Firestore se device data ko fetch karna
  RxMap<String, dynamic> devValues = RxMap<String, dynamic>();
  RxDouble totalPower = 0.0.obs;

  //Using streamBuilder function
  void fetchDeviceData() {
    try {
      FirebaseFirestore.instance
          .collection('sensorData')
          .orderBy('timestamp', descending: true)
          .snapshots()
          .listen((QuerySnapshot snapshot) {
        if (snapshot.docs.isNotEmpty) {
          final deviceValues = snapshot.docs.first.data();
          devValues.value = deviceValues as Map<String, dynamic>;

          print('deviceValues: $deviceValues');

          device.value = DeviceModel.fromMap(deviceValues);

          //---------debuggingg--------
          print('Device data updated: $deviceValues');
        } else {
          print("no data found");
        }
      });
    } catch (e) {
      print("Error fetching device data: $e");
      VLoaders.errorSnackBar(
          title: 'error in fetching data',
          message: 'Something went wrong while fetching device data.');
    }
  }

  void calculateTotalPowerStream() {
    FirebaseFirestore.instance
        .collection('sensorData')
        .snapshots()
        .listen((querySnapshot) {
      double pSum = 0;
      for (var pow in querySnapshot.docs) {
        final data = pow.data();
        if (data.containsKey('power')) {
          try {
            final power = data['power'] as double?;
            if (power != null) {
              pSum += power;
            } else {
              print('power is null');
            }
          } catch (e) {
            print('error in accessing power: $e');
          }
        } else {
          print('document does not have power field');
        }
      }
      totalPower.value = pSum / 1000.0; //kWh
      print('Total Power: ${totalPower.value}');
    });
  }
  /*Future<void> fetchDeviceData() async {
    try {
      final deviceSnapshot =
          await _firestore.collection('devices').doc('ESP32_TEST_DEVICE').get();
      device(DeviceModel.fromSnapshot(deviceSnapshot));
      final deviceValues = await _firestore
          .collection('sensorData')
          .orderBy('timestamp', descending: true)
          .get();
      devValues.value = deviceValues.docs.first.data();
      print('printing bruh...');
      print(deviceSnapshot.data());
      print('another data');
      print(deviceValues.docs.first.data());
      print('done prinitng');
    } catch (e) {
      print("Error fetching device data: $e");
    }
  }*/

  //fetching voltage,current,power from SENSORDATA
  /*Future<void> fetchDeviceValues() async {
    try {
      final deviceValues = await _firestore
          .collection('sensorData')
          .where('device_id', isEqualTo: 'ESP32_TEST_DEVICE')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .get();
      if (deviceValues.docs.isNotEmpty) {
        device(DeviceModel.fromSnapshot(
            deviceValues.docs.first as DocumentSnapshot<Object?>));
        print('Latest sensor data: ${deviceValues.docs.first}');
      } else {
        print('No sensor data found for ESP32_TEST_DEVICE');
      }
      print('done prinitng');
    } catch (e) {
      print("Error fetching device data: $e");
    }
  }*/

  //update the device status in Firestore
  Future<void> updateDeviceStatus(String status) async {
    try {
      await _firestore.collection('devices').doc('ESP32_TEST_DEVICE').update({
        'status': status,
      });
      // Optionally update the local 'device' state
      device.value.status = status;
    } catch (e) {
      print("Error updating device status: $e");
      VLoaders.errorSnackBar(
        title: 'Error in updating device status',
        message: 'Something went wrong. please re-connect your device',
      );
    }
  }

  // function to fetch device insights from firestore
  RxMap<String, dynamic> deviceInsights = RxMap<String, dynamic>();
  void fetchDeviceInsights() {
    //print('running...');
    try {
      FirebaseFirestore.instance
          .collection('insights')
          .doc('latest')
          .snapshots()
          .listen((DocumentSnapshot snapshot) {
        if (snapshot.exists) {
          deviceInsights.value = snapshot.data() as Map<String, dynamic>;
        } else {
          print('Document does not exist');
        }
      });

      //----------DEBUGGING-------------//
      //print('run');
      //if (deviceInsight.exists) {
      //print('still running....');
      //final data = deviceInsight.data();
      //if (data != null) {
      //deviceInsights.value = data as Map<String, dynamic>;
      // print(deviceInsight.data());
      // print('done1');
      //} else {
      //  print('document data is null');
      //}
      //print(deviceInsights.value);
      //print('done');
      //} else {
      //print('cant running...');
      //print('Document does not exists');
      //print('nooo running...');
      //}
    } catch (e) {
      print('Error fetching device insights: $e');
      VLoaders.errorSnackBar(
        title: 'Error in fetching insights',
        message: 'Unable to fetch device insights. Please try again later.',
      );
    }
  }

  //fetching anomaly
  RxMap<String, dynamic> deviceAnomaly = RxMap<String, dynamic>();
  void fetchDeviceAnomaly() {
    //print('running...');
    try {
      FirebaseFirestore.instance
          .collection('anomalies')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .snapshots()
          .listen((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          final latestDocId = querySnapshot.docs.first;

          deviceAnomaly.value = latestDocId.data() as Map<String, dynamic>;
          deviceAnomaly.assignAll(latestDocId.data() as Map<String, dynamic>);
          print('fetchDeviceAnomaly: deviceAnomaly updated: $deviceAnomaly');
          //FirebaseFirestore.instance
          //    .collection('anomalies')
          //    .doc(latestDocId)
          //    .snapshots()
          //    .listen((DocumentSnapshot snapshot) {
          //  if (snapshot.exists) {
          //    deviceAnomaly.value = snapshot.data() as Map<String, dynamic>;
          //  } else {
          //    print('Document does not exist');
          //  }
          //});
        } else {
          print('Anomaly Document does not exist');
        }
        Future.delayed(Duration(seconds: 5), () {
          deviceAnomaly.value = {
            'ai_explanation':
                'Power consumption (1400W) is higher than recent trends (1100-1300W). Check the connected appliance for malfunctions or excessive load. If the issue persists, schedule maintenance.'
          };
        });
      });
    } catch (e) {
      print('Error fetching device insights: $e');
      VLoaders.errorSnackBar(
        title: 'Error in fetching anomalies',
        message: 'Unable to fetch device anomalies. Please try again later.',
      );
    }
  }

  //for debugging, to check whether stream is disposing off not not
  @override
  void onClose() {
    super.onClose();
    print('DeviceController onClose() called');
    // ... your cleanup logic ...
  }
}

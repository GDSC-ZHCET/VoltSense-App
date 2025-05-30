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
    status: false,
    devInsights: '',
    lastUpdated: '',
  ).obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    print('DeviceController initialized');
    //print('fetching device data...');
    //fetchDeviceData();
    print('fetching device anomaly...');
    fetchDeviceAnomaly();
    print('fetching device insights...');
    fetchDeviceInsights();
    print('calculating total power...');
    calculateTotalPowerStream();
    print('void init called');
    startStatusStream();
    print('DeviceController onInit() called');
  }

  // Firestore se device data ko fetch karna
  RxMap<String, dynamic> devValues = RxMap<String, dynamic>();
  final RxBool deviceStatus = false.obs;
  RxDouble totalPower = 0.0.obs;

  //Using streamBuilder function
  Stream<Map<String, dynamic>> get deviceDataStream {
    return _firestore
        .collection('sensorData')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();
        devValues.value = data;
        device.value = DeviceModel.fromMap(data);
        return data;
      } else {
        return {};
      }
    });
  }

  void startStatusStream() {
    FirebaseFirestore.instance
        .collection('devices')
        .doc('ESP32_TEST_DEVICE')
        .snapshots()
        .listen((snapshot) {
      final data = snapshot.data() as Map<String, dynamic>;
      deviceStatus.value = data['status'] ?? false;
    });
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
            final power = (data['power'] as num).toDouble();
            pSum += power;
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

  //Future<void> updateDeviceStatus(String status) async {
  //  try {
  //    await _firestore.collection('devices').doc('ESP32_TEST_DEVICE').update({
  //      'status': status,
  //    });
  //    // Optionally update the local 'device' state
  //    device.value.status = (status.toLowerCase() == 'true');
  //  } catch (e) {
  //    print("Error updating device status: $e");
  //    VLoaders.errorSnackBar(
  //      title: 'Error in updating device status',
  //      message: 'Something went wrong. please re-connect your device',
  //    );
  //  }
  //}

  // function to fetch device insights from firestore
  RxMap<String, dynamic> deviceInsights = RxMap<String, dynamic>();
  void fetchDeviceInsights() {
    //print('running...');
    try {
      FirebaseFirestore.instance
          .collection('insights')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .snapshots()
          .listen((QuerySnapshot snapshot) {
        if (snapshot.docs.isNotEmpty) {
          deviceInsights.value =
              snapshot.docs.first.data() as Map<String, dynamic>;
        } else {
          print('Document does not exist');
        }
      });
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
          //deviceAnomaly.value = latestDocId.data() as Map<String, dynamic>;
          deviceAnomaly.assignAll(latestDocId.data() as Map<String, dynamic>);
          print('fetchDeviceAnomaly: deviceAnomaly updated: $deviceAnomaly');
        } else {
          print('No anomaly document found.');
        }
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
  }
}

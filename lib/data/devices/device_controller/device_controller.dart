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
    lastUpdated: '',
  ).obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchDeviceData();
  }

  // Firestore se device data ko fetch karna
  Future<void> fetchDeviceData() async {
    try {
      final deviceSnapshot =
          await _firestore.collection('devices').doc('ESP32_TEST_DEVICE').get();
      device(DeviceModel.fromSnapshot(deviceSnapshot));
    } catch (e) {
      print("Error fetching device data: $e");
    }
  }

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
        message:
            'Something went wrong while fetcing information. please re-connect your device',
      );
    }
  }
}

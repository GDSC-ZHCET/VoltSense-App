//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:get/get.dart';
//import 'package:voltsense2/features/nav_bar/screens/graph/model/data_trend_model.dart';
//import 'package:voltsense2/utils/constants/loaders.dart';
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:voltsense2/data/devices/device_controller/device_controller.dart';

class GraphData {
  GraphData(
    this.time,
    this.voltage,
    this.current,
    this.power,
  );

  final double time;
  final double voltage;
  final double current;
  final double power;
}

class GraphDataController extends GetxController {
  //stream function for VOTAAAAAAAAAAAGEEEEEEEE
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    print('GraphDataController initialized');
  }

  Stream<List<GraphData>> get voltageDataStream {
    return _firestore
        .collection('sensorData')
        .orderBy('timestamp', descending: true)
        .limit(10)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        final timestampString = data['timestamp'] as String?;
        //final bool boolStatus = DeviceController.deviceStatus.value;

        DateTime dateTime;

        if (timestampString != null) {
          dateTime = DateTime.tryParse(timestampString) ?? DateTime.now();
        } else {
          dateTime = DateTime.now();
        }
        return GraphData(
          dateTime.millisecondsSinceEpoch.toDouble(),
          (data['voltage'] as num).toDouble(),
          (data['current'] as num?)?.toDouble() ?? 0.0,
          (data['power'] as num?)?.toDouble() ?? 0.0,
        );
      }).toList();
    });
  }
}

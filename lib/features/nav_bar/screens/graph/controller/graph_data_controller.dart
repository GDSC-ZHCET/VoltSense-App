import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:voltsense2/features/nav_bar/screens/graph/data_trend_model.dart';
import 'package:voltsense2/features/nav_bar/screens/graph/model/data_trend_model.dart';
import 'package:voltsense2/utils/constants/loaders.dart';

class GraphDataController extends GetxController {
  static GraphDataController get instance => Get.find();

  final FirebaseFirestore _graphFirestoreData = FirebaseFirestore.instance;

  RxList<TrendData> voltageValueList = <TrendData>[].obs;
  RxList<TrendData> currentValueList = <TrendData>[].obs;
  RxList<TrendData> powerValueList = <TrendData>[].obs;

  //List<int> voltageData = [];
  //List<int> currentData = [];
  //List<int> powerData = [];
//
  @override
  void onInit() {
    super.onInit();
    fetchGraphValues();
  }

  void fetchGraphValues() {
    try {
      print("fetching grap Values...");
      FirebaseFirestore.instance
          .collection('sensorData')
          .orderBy('timestamp', descending: true)
          .limit(6)
          .snapshots()
          .listen((QuerySnapshot snapshot) {
        if (snapshot.docs.isNotEmpty) {
          final List<TrendData> dataList = snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return TrendData(
              time: data['timestamp'].toDouble(),
              voltage: data['voltage'].toDouble(),
              current: data['current']?.toDouble() ?? 0.0,
              power: data['power']?.toDouble() ?? 0.0,
            );
          }).toList();

          voltageValueList.value = dataList
              .map((data) => TrendData(
                  time: data.time,
                  voltage: data.voltage,
                  current: 0.0,
                  power: 0.0))
              .toList();

          currentValueList.value = dataList
              .map((data) => TrendData(
                    time: data.time,
                    current: data.current,
                    voltage: 0.0,
                    power: 0.0,
                  ))
              .toList();

          powerValueList.value = dataList
              .map((data) => TrendData(
                    time: data.time,
                    power: data.power,
                    voltage: 0.0,
                    current: 0.0,
                  ))
              .toList();

          print('Graph data: $dataList');
        } else {
          print('no data found');
          voltageValueList.value = [];
          currentValueList.value = [];
          powerValueList.value = [];
        }
      });
    } catch (e) {
      VLoaders.errorSnackBar(
          title: 'error in fetching data',
          message: 'something went wrong in fetching data: $e');
    }
  }
}

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:voltsense2/utils/constants/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  ///update the connection status based on changes in connectivity and show a relevant popup for no internet connection
  Future<void> _updateConnectionStatus(ConnectivityResult results) async {
    _connectionStatus.value = results;
    //results.isNotEmpty ? results.first : ConnectivityResult.none;
    if (_connectionStatus.value == ConnectivityResult.none) {
      VLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  /// check the internet connection status
  /// returns true if connected false otherwise
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      // ignore: unrelated_type_equality_checks
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      // Handle the exception
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel(); // Dispose of the stream properly
    super.onClose();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class DeviceModel {
  final String deviceId;
  final double voltage;
  final double current;
  final double power;
  String status;
  final String lastUpdated;
  final String devInsights;

  DeviceModel({
    required this.deviceId,
    required this.voltage,
    required this.current,
    required this.power,
    required this.status,
    required this.devInsights,
    required this.lastUpdated,
  });

  //Conversion of firestore data to DeviceModel
  factory DeviceModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return DeviceModel(
      deviceId: data['device_id'] ?? '',
      voltage: data['voltage'] ?? 0.0,
      current: data['current'] ?? 0.0,
      power: data['power'] ?? 0.0,
      status: data['status'] ?? '',
      devInsights: data['response'] ?? '',
      lastUpdated: data['last_updated'] ?? '',
    );
  }

  // Added fromMap method to convert Map to DeviceModel
  factory DeviceModel.fromMap(Map<String, dynamic> data) {
    return DeviceModel(
      deviceId: data['device_id'] ?? '',
      voltage: data['voltage'] ?? 0.0,
      current: data['current'] ?? 0.0,
      power: data['power'] ?? 0.0,
      status: data['status'] ?? '',
      devInsights: data['response'] ?? '',
      lastUpdated: data['last_updated'] ?? '',
    );
  }

  // JSON format mein convert karna
  Map<String, dynamic> toJson() {
    return {
      'device_id': deviceId,
      'voltage': voltage,
      'current': current,
      'power': power,
      'status': status,
      'response': devInsights,
      'last_updated': lastUpdated,
    };
  }
}

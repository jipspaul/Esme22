import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue_example/widgets.dart';

class BluetoothManager {
  late List<FlutterBlue> _deviceblue;

  BluetoothManager() {
    FlutterBlue flutterBlue = FlutterBlue.instance;

    _deviceblue = questionRepo.scandeviceluetooth();
    print(ListQuestions(_questions).toJson().entries);
  }

  void scandeviceluetooth() {
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    // Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });
    // Stop scanning
    flutterBlue.stopScan();
  }
  void Connectdeviceluetooth() {
    // Connect to the device
    await device.connect();
  }
  void Disconnectdeviceluetooth() {
    // Disconnect from device
    device.disconnect();
  }


}

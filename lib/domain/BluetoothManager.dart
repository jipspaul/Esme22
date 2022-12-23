import 'package:flutter_blue/flutter_blue.dart';

class BluetoothManager {
  // Créez une instance de FlutterBlue en utilisant le constructeur FlutterBlue.instance
  var flutterBlue = FlutterBlue.instance;

  void scan() {
    // Commencez à scanner les appareils Bluetooth environnants
    flutterBlue.startScan(timeout: Duration(seconds: 4), (){});
  }

}


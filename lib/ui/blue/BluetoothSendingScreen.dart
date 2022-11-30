import 'package:flutter/material.dart';


class BluetoothSendingScreen extends StatefulWidget {
  @override
  State<BluetoothSendingScreen> createState() => _BluetoothSendingScreenState();
}

class _BluetoothSendingScreenState extends State<BluetoothSendingScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('APPAREILLAGE'),
      ),
      body: Center(
          child: Column(
            children: [
              Flexible(child: Text("yvehj snv k")),
            ],
          ),
      ),
    );
  }

  Widget partyFinishScreen(String score) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("FINISH score: $score"),
      ),
    );
  }
}

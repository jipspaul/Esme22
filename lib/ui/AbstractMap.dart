import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/maps/mapsMobile.dart';

abstract class MapWidget extends StatefulWidget {
  factory MapWidget() => getMap() as MapWidget;
}

Widget getMap() {
  return MapSample();
}

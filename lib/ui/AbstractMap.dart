import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/maps/mapsMobile.dart';
import 'maps/Maps.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class MapWidget extends StatefulWidget {
  factory MapWidget() => getMap() as MapWidget;
}

Widget getMap() {
  return kIsWeb ? getMapWidget() : MapSample();
}

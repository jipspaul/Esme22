import 'package:flutter/material.dart';
import 'Maps.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class MapWidget extends StatefulWidget {
  factory MapWidget() => getMap();
}

Widget getMap() {
  return kIsWeb ? getMapWidget() : getMapWidget();
}

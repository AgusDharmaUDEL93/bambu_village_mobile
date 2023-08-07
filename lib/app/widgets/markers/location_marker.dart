import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../models/location.dart';

class LocationMarker extends Marker {
  LocationMarker({required this.locationElement})
      : super(
          anchorPos: AnchorPos.align(AnchorAlign.top),
          width: 80,
          height: 80,
          point: LatLng(
            double.parse(locationElement.latitude),
            double.parse(locationElement.longitude),
          ),
          builder: (context) => const Icon(
            Icons.location_pin,
            size: 50,
          ),
        );
  final LocationElement locationElement;
}

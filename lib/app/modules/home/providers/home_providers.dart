import 'dart:convert';

import 'package:bambu_village_mobile/app/models/location.dart';
import 'package:flutter/services.dart';

Future<Location> locationProviders() async {
  final String response =
      await rootBundle.loadString("assets/data/json/marker.json");
  final jsonData = await json.decode(response);
  final data = Location.fromJson(jsonData);
  return data;
}

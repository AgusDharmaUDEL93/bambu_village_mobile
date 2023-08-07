import 'dart:convert';

import 'package:bambu_village_mobile/app/models/regions.dart';
import 'package:flutter/services.dart';

Future<List<Regions>> drawerProviders() async {
  final response = await rootBundle.loadString("assets/data/json/regions.json");
  final data = regionsFromJson(response);
  return data;
}

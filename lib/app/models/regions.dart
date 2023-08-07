// To parse this JSON data, do
//
//     final regions = regionsFromJson(jsonString);

import 'dart:convert';

List<Regions> regionsFromJson(String str) =>
    List<Regions>.from(json.decode(str).map((x) => Regions.fromJson(x)));

String regionsToJson(List<Regions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Regions {
  String region;
  List<Regency> regency;

  Regions({
    required this.region,
    required this.regency,
  });

  factory Regions.fromJson(Map<String, dynamic> json) => Regions(
        region: json["region"],
        regency:
            List<Regency>.from(json["regency"].map((x) => Regency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "region": region,
        "regency": List<dynamic>.from(regency.map((x) => x.toJson())),
      };
}

class Regency {
  String name;
  List<Location> location;

  Regency({
    required this.name,
    required this.location,
  });

  factory Regency.fromJson(Map<String, dynamic> json) => Regency(
        name: json["name"],
        location: List<Location>.from(
            json["location"].map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x.toJson())),
      };
}

class Location {
  String name;
  String latitude;
  String longitude;

  Location({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
      };
}

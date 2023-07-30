// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  List<TempatPariwisata> tempatPariwisata;

  Location({
    required this.tempatPariwisata,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        tempatPariwisata: List<TempatPariwisata>.from(
            json["tempat_pariwisata"].map((x) => TempatPariwisata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tempat_pariwisata":
            List<dynamic>.from(tempatPariwisata.map((x) => x.toJson())),
      };
}

class TempatPariwisata {
  String nama;
  String latitude;
  String longitude;
  String description;

  TempatPariwisata({
    required this.nama,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  factory TempatPariwisata.fromJson(Map<String, dynamic> json) =>
      TempatPariwisata(
        nama: json["nama"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
      };
}

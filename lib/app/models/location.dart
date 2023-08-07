// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
    List<LocationElement> location;

    Location({
        required this.location,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        location: List<LocationElement>.from(json["location"].map((x) => LocationElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "location": List<dynamic>.from(location.map((x) => x.toJson())),
    };
}

class LocationElement {
    String name;
    String latitude;
    String longitude;
    String description;

    LocationElement({
        required this.name,
        required this.latitude,
        required this.longitude,
        required this.description,
    });

    factory LocationElement.fromJson(Map<String, dynamic> json) => LocationElement(
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
    };
}

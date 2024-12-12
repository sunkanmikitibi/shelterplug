// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);
 
import 'dart:convert';

List<Location> locationFromJson(String str) => List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(List<Location> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
  final int id;
  final String locationname;

  Location({
    required this.id,
    required this.locationname,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    locationname: json["locationname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "locationname": locationname,
  };
}

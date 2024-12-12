// To parse this JSON data, do
//
//     final propertyManager = propertyManagerFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

List<PropertyManager> propertyManagerFromJson(String str) => List<PropertyManager>.from(json.decode(str).map((x) => PropertyManager.fromJson(x)));

String propertyManagerToJson(List<PropertyManager> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PropertyManager {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String stateId;
  final String typeOfHouse;
  final String vendorId;
  final String expectedRent;
  final String comments;

  PropertyManager({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.stateId,
    required this.typeOfHouse,
    required this.vendorId,
    required this.expectedRent,
    required this.comments,
  });

  factory PropertyManager.fromJson(Map<String, dynamic> json) => PropertyManager(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    stateId: json["state_id"],
    typeOfHouse: json["type_of_house"],
    vendorId: json["vendor_id"],
    expectedRent: json["expected_rent"],
    comments: json["comments"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "state_id": stateId,
    "type_of_house": typeOfHouse,
    "vendor_id": vendorId,
    "expected_rent": expectedRent,
    "comments": comments,
  };
}

// To parse this JSON data, do
//
//     final vendor = vendorFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

List<Vendor> vendorFromJson(String str) => List<Vendor>.from(json.decode(str).map((x) => Vendor.fromJson(x)));

String vendorToJson(List<Vendor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vendor {
  final int id;
  final String name;

  Vendor({
    required this.id,
    required this.name,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

// To parse this JSON data, do
//
//     final interiorApplication = interiorApplicationFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

List<InteriorApplication> interiorApplicationFromJson(String str) => List<InteriorApplication>.from(json.decode(str).map((x) => InteriorApplication.fromJson(x)));

String interiorApplicationToJson(List<InteriorApplication> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InteriorApplication {
  final int id;
  final String fullname;
  final String phone;
  final String email;
  final String locationId;
  final String city;
  final String budget;
  final String vendorId;
  final String typeOfApartment;
  final String possessionTimeline;
  final String scopeOfWork;
  final String comments;

  InteriorApplication({
    required this.id,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.locationId,
    required this.city,
    required this.budget,
    required this.vendorId,
    required this.typeOfApartment,
    required this.possessionTimeline,
    required this.scopeOfWork,
    required this.comments,
  });

  factory InteriorApplication.fromJson(Map<String, dynamic> json) => InteriorApplication(
    id: json["id"],
    fullname: json["fullname"],
    phone: json["phone"],
    email: json["email"],
    locationId: json["location_id"],
    city: json["city"],
    budget: json["budget"],
    vendorId: json["vendor_id"],
    typeOfApartment: json["type_of_apartment"],
    possessionTimeline: json["possession_timeline"],
    scopeOfWork: json["scope_of_work"],
    comments: json["comments"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "phone": phone,
    "email": email,
    "location_id": locationId,
    "city": city,
    "budget": budget,
    "vendor_id": vendorId,
    "type_of_apartment": typeOfApartment,
    "possession_timeline": possessionTimeline,
    "scope_of_work": scopeOfWork,
    "comments": comments,
  };
}

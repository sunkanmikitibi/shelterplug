// To parse this JSON data, do
//
//     final property = propertyFromJson(jsonString);

import 'dart:convert';

List<Property> propertyFromJson(String str) => List<Property>.from(json.decode(str).map((x) => Property.fromJson(x)));

String propertyToJson(List<Property> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Property {
  final int id;
  final String title;
  final String slug;
  final String propertyAddress;
  final String city;
  final String description;
  final String amount;
  final String image;
  final String isActive;
  final dynamic user;
  final String size;
  final String type;
  final String noOfBathrooms;
  final String noOfBedrooms;
  final String location;
  final Map<String, Picture> pictures;

  Property({
    required this.id,
    required this.title,
    required this.slug,
    required this.propertyAddress,
    required this.city,
    required this.description,
    required this.amount,
    required this.image,
    required this.isActive,
    required this.user,
    required this.size,
    required this.type,
    required this.noOfBathrooms,
    required this.noOfBedrooms,
    required this.location,
    required this.pictures,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    propertyAddress: json["property_address"],
    city: json["city"],
    description: json["description"],
    amount: json["amount"],
    image: json["image"],
    isActive: json["isActive"],
    user: json["user"],
    size: json["size"],
    type: json["type"],
    noOfBathrooms: json["no_of_bathrooms"],
    noOfBedrooms: json["no_of_bedrooms"],
    location: json["location"],
    pictures: Map.from(json["pictures"]).map((k, v) => MapEntry<String, Picture>(k, Picture.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "property_address": propertyAddress,
    "city": city,
    "description": description,
    "amount": amount,
    "image": image,
    "isActive": isActive,
    "user": user,
    "size": size,
    "type": type,
    "no_of_bathrooms": noOfBathrooms,
    "no_of_bedrooms": noOfBedrooms,
    "location": location,
    "pictures": Map.from(pictures).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Picture {
  final String name;
  final String fileName;
  final String uuid;
  final String previewUrl;
  final String originalUrl;
  final String order;
  final List<dynamic> customProperties;
  final String extension;
  final String size;

  Picture({
    required this.name,
    required this.fileName,
    required this.uuid,
    required this.previewUrl,
    required this.originalUrl,
    required this.order,
    required this.customProperties,
    required this.extension,
    required this.size,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    name: json["name"],
    fileName: json["file_name"],
    uuid: json["uuid"],
    previewUrl: json["preview_url"],
    originalUrl: json["original_url"],
    order: json["order"],
    customProperties: List<dynamic>.from(json["custom_properties"].map((x) => x)),
    extension: json["extension"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "file_name": fileName,
    "uuid": uuid,
    "preview_url": previewUrl,
    "original_url": originalUrl,
    "order": order,
    "custom_properties": List<dynamic>.from(customProperties.map((x) => x)),
    "extension": extension,
    "size": size,
  };
}

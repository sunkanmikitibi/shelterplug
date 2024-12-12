import 'dart:convert';

List<Plan> locationFromJson(String str) =>
    List<Plan>.from(json.decode(str).map((x) => Plan.fromJson(x)));

String locationToJson(List<Plan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plan {
  final int id;
  final int? plancategory;
  final String name;
  final String amount;
  final String? description;

  Plan({
    required this.id,
    required this.amount,
    this.plancategory,
    required this.name,
    this.description,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        plancategory: json["plancategory"],
        amount: json["amount"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "plancategory": plancategory,
        "name": name,
        "amount": amount,
        "description": description,
      };
}

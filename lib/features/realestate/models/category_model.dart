import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.image,
    required this.name,
    required this.isFeatured,
  });

// Empty Helper Function
  static CategoryModel empty() =>
      CategoryModel(
          id: '',
          image: '',
          name: '',
          isFeatured: false,
      );

  // Convert Model to json Structure to store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'isFeatured': isFeatured,
    };
  }

  //Map json oriented document snapshot from Firebase to CategoryModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map Json record to Model
      return CategoryModel(
          id: document.id,
          image: data['Image'] ?? '',
          name: data['Name'] ?? '',
          isFeatured: data['isFeatured'] ?? false);
    } else {
      return CategoryModel.empty();
    }
  }
} 

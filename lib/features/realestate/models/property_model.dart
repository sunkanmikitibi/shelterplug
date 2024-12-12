import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:realestateapi/model/user_model.dart';

class PropertyModel {
  String id;
  String title;
  String? categoryId;
  String? propertyAddress;
  bool isFeatured;
  double amount;
  String? image;
  String? size;
  UserModel? user;
  String bedrooms;
  String bathrooms;
  String? kitchens;
  String? description;
  List<String>? propertyImages;

//constructor
  PropertyModel({
    required this.id,
    required this.title,
    this.categoryId,
    this.propertyAddress,
    required this.amount,
    required this.bedrooms,
    required this.bathrooms,
    required this.isFeatured,
    this.kitchens,
    this.user,
    this.size,
    this.image,
    this.description,
    this.propertyImages,
  });

  toJson() {
    return {
      'Title': title,
      'CategoryId': categoryId,
      'PropertyAddress': propertyAddress,
      'Amount': amount,
      'Bedrooms': bedrooms,
      'Bathrooms': bathrooms,
      'IsFeatured': isFeatured,
      'Kitchens': kitchens,
      'User': user!.toJson(),
      'Size': size,
      'Description': description,
      'Image': image,
      'PropertyImages': propertyImages ?? [],
    };
  }

  PropertyModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['Id'],
          title: json['Title'] as String,
          categoryId: json['CategoryId']! as String,
          propertyAddress: json['PropertyAddress']! as String,
          amount: json['Amount']! as double,
          bedrooms: json['Bedrooms']! as String,
          bathrooms: json['Bathrooms']! as String,
          kitchens: json['Kitchens']! as String,
          isFeatured: json['IsFeatured']! as bool,
          size: json['Size']! as String,
          description: json['Description']! as String,
          image: json['Image']! as String,
        );

  factory PropertyModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return PropertyModel.empty();
    final data = document.data()!;
    return PropertyModel(
      id: document.id,
      title: data['Title'],
      categoryId: data['CategoryId'] ?? '',
      propertyAddress: data['PropertyAddress'] ?? '',
      amount: double.parse((data['Amount'] ?? 0.0).toString()),
      isFeatured: data['isFeatured'] ?? false,
      image: data['Image'] ?? '',
      bedrooms: data['Bedrooms'] ?? '',
      bathrooms: data['Bathrooms'] ?? '',
      kitchens: data['Kitchens'] ?? '',
      size: data['Size'] ?? '',
      user: UserModel.fromJson(data['User']),
      description: data['Description'] ?? '',
      propertyImages: data['PropertyImages'] != null
          ? List<String>.from(data['PropertyImages'])
          : [],
    );
  }

  //Map json-oriented document snapshot from Firebase to Model
  factory PropertyModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return PropertyModel(
      id: document.id,
      title: data['Title'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      amount: data['Amount'] ?? 0,
      image: data['Image'],
      size: data['Size'] ?? '',
      bedrooms: data['Bedrooms'] ?? '',
      bathrooms: data['Bathrooms'] ?? '',
      user: UserModel.fromJson(data['User']),
      kitchens: data['Kitchens'] ?? '',
      description: data['Description'] ?? '',
      propertyAddress: data['PropertyAddress'] ?? '',
      propertyImages: data['PropertyImages'] != null
          ? List<String>.from(data['PropertyImages'])
          : [],
    );
  }

  static PropertyModel empty() => PropertyModel(
        id: '',
        title: '',
        amount: 0,
        categoryId: '',
        propertyImages: [],
        isFeatured: false,
        description: '',
        propertyAddress: '',
        image: '',
        size: '',
        bedrooms: '',
        kitchens: '',
        bathrooms: '',
      );
}

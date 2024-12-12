import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';

import '../exceptions/firebase_exceptions.dart';
import '../exceptions/platform_exception.dart';

class PropertyRepository extends GetxController {
  static PropertyRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<PropertyModel>> getFeaturedRentProperties() async {
    try {
      final snapshot = await _db
          .collection('Propertys')
          .where("CategoryId", isEqualTo: "1")
          .limit(4)
          .get();
      return snapshot.docs
          .map((document) => PropertyModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<PropertyModel>> fetchPropertyByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<PropertyModel> propertyList = querySnapshot.docs
          .map((doc) => PropertyModel.fromQuerySnapshot(doc))
          .toList();
      return propertyList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<PropertyModel>> getFeaturedShortLetProperties() async {
    try {
      final snapshot = await _db
          .collection('Propertys')
          .where("CategoryId", isEqualTo: "3")
          .limit(4)
          .get();
      return snapshot.docs
          .map((document) => PropertyModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<PropertyModel>> getAllFavouritesPropertys(
      List<String> ids) async {
    try {
      final snapshot = await _db
          .collection('Propertys')
          .where(FieldPath.documentId, whereIn: ids)
          .get();
      return snapshot.docs
          .map((querySnapshot) => PropertyModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<PropertyModel>> getFeaturedSalesProperties() async {
    try {
      final snapshot = await _db
          .collection('Propertys')
          .where("CategoryId", isEqualTo: "2")
          .limit(4)
          .get();
      return snapshot.docs
          .map((document) => PropertyModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<PropertyModel>> getAllSaleProperties() async {
    try {
      final snapshot = await _db
          .collection('Propertys')
          .where("CategoryId", isEqualTo: "2")
          .get();
      return snapshot.docs
          .map((document) => PropertyModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<PropertyModel>> getAllShortLetProperties() async {
    try {
      final snapshot = await _db
          .collection('Propertys')
          .where("CategoryId", isEqualTo: "3")
          .get();
      return snapshot.docs
          .map((document) => PropertyModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<PropertyModel>> getAllRentProperties() async {
    try {
      final snapshot = await _db
          .collection('Propertys')
          .where("CategoryId", isEqualTo: "1")
          .get();
      return snapshot.docs
          .map((document) => PropertyModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<PropertyModel>> getAllProperties() async {
    try {
      final snapshot = await _db
          .collection('Propertys')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs
          .map((document) => PropertyModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<PropertyModel>> getPropertyByCategory(String categoryId) async {
    try {
      final snapshot = await _db
          .collection("Propertys")
          .where('CategoryId', isEqualTo: categoryId)
          .get();
      final result =
          snapshot.docs.map((e) => PropertyModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<PropertyModel>> getPropertyForCategory(
      {required String categoryId, int limit = 6}) async {
    try {
      // query to get all documents where id matches the provided categoryId and fetch limited or unlimited based on limit

      QuerySnapshot propertyCategoryQuery = limit == -1
          ? await _db
              .collection('Propertys')
              .where('CategoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('Propertys')
              .where('CategoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      List<String> propertyIds =
          propertyCategoryQuery.docs.map((doc) => doc['id'] as String).toList();
      final propertyQuery = await _db
          .collection('Propertys')
          .where(FieldPath.documentId, whereIn: propertyIds)
          .get();

      List<PropertyModel> properties = propertyQuery.docs
          .map((doc) => PropertyModel.fromSnapshot(doc))
          .toList();

      return properties;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}

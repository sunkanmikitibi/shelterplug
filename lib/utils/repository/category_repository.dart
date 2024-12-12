
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:realestateapi/features/realestate/models/category_model.dart';
import 'package:realestateapi/utils/exceptions/firebase_exceptions.dart';
import 'package:realestateapi/utils/exceptions/platform_exception.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance =>  Get.find();

  final _db = FirebaseFirestore.instance;

  // Get all Categories
  Future<List<CategoryModel>> getAllCategories()  async {
    try{
        final snapshot =  await _db.collection('Categories').get();
        final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
        return list;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
// Upload Categories to the Cloud
}
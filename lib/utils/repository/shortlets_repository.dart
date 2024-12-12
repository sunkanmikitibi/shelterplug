import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';
import 'package:realestateapi/utils/exceptions/firebase_exceptions.dart';
import 'package:realestateapi/utils/exceptions/platform_exception.dart';

class ShortletRepository extends GetxController {
  static ShortletRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<PropertyModel>> getShortLetProperties() async {
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
}

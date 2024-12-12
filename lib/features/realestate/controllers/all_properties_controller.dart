import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';
import 'package:realestateapi/utils/popups/loaders.dart';
import 'package:realestateapi/utils/repository/property_repository.dart';

class AllPropertiesController extends GetxController {
  static AllPropertiesController get instance => Get.find();

  final propertyRepository = PropertyRepository.instance;
  final RxString selectedSortOption = 'Title'.obs;
  final RxList<PropertyModel> properties = <PropertyModel>[].obs;

  Future<List<PropertyModel>> fetchPropertiesByQuery(Query? query) async {
    try{
      if(query == null) return [];
      final properties = await propertyRepository.fetchPropertyByQuery(query);
      return properties;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!,', message: e.toString());
      return [];
    }
  }

  void sortProperties (String sortOption) {
    selectedSortOption.value = sortOption;

    switch(sortOption) {
      case 'Title' :
        properties.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Amount' :
        properties.sort((a, b) => a.amount.compareTo(b.amount));
        break;
      case 'Bedrooms':
        properties.sort((a, b) => a.bedrooms.compareTo(b.bedrooms));
        break;
      case 'Bathrooms' :
        properties.sort((a, b) => a.bathrooms.compareTo(b.bathrooms));
        break;
      case 'Shortlets' :
        properties.sort((a, b) {
          if(a.categoryId! == "3") {
            return a.categoryId!.compareTo(b.categoryId!);
          } else {
            return -1;
          }
        } );
        break;
        default:
          properties.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProperties(List<PropertyModel> properties) {
    this.properties.assignAll(properties);
    sortProperties('Title');
  }
}

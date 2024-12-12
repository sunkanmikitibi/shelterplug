import 'package:get/get.dart';
import 'package:realestateapi/utils/repository/property_repository.dart';

import '../../../utils/popups/loaders.dart';
import '../models/property_model.dart';

class PropertyController extends GetxController {
  static PropertyController get instance => Get.find();

  final propertyRepository =  Get.put(PropertyRepository());

  final isLoading = false.obs;

  RxList<PropertyModel> allShortLets = <PropertyModel>[].obs;
  RxList<PropertyModel> aProperties = <PropertyModel>[].obs;
  @override
  void onInit() {
    fetchAllShortLetProperties();
    fetchAllProperties();
    super.onInit();
  }



  void fetchAllShortLetProperties() async {
    try {
      // show loader while loading products
      isLoading.value = true;
      //fetch properties
      final aShortLets =
      await propertyRepository.getAllShortLetProperties();
      //Assign Properties
      allShortLets.assignAll(aShortLets);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<PropertyModel>> fetchAllProperties() async {
    try {
      final allProperties =
      await propertyRepository.getAllProperties();
      return allProperties;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
      return [];
    }
  }
}
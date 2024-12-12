import 'package:get/get.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';
import 'package:realestateapi/utils/popups/loaders.dart';
import 'package:realestateapi/utils/repository/property_repository.dart';

class HomePropertyController extends GetxController {
  static HomePropertyController get instance => Get.find();

  final propertyRepository = Get.put(PropertyRepository());

  final isLoading = false.obs;
  RxList<PropertyModel> featuredRentProperties = <PropertyModel>[].obs;
  RxList<PropertyModel> featuredSaleProperties = <PropertyModel>[].obs;

  RxList<PropertyModel> featuredShortLetProperties = <PropertyModel>[].obs;
  RxList<PropertyModel> allProperties = <PropertyModel>[].obs;
  RxList<PropertyModel> allSaleProperties = <PropertyModel>[].obs;
  RxList<PropertyModel> allRentProperties = <PropertyModel>[].obs;

  @override
  void onInit() {
    fetchRentProperties();
    fetchAllProperties();
    fetchShortProperties();
    fetchSaleProperties();
    fetchAllSaleProperties();
    fetchAllRentProperties();
    super.onInit();
  }

  void fetchRentProperties() async {
    try {
      // show loader while loading products
      isLoading.value = true;
      //fetch properties
      final fRentProperties =
          await propertyRepository.getFeaturedRentProperties();
      //Assign Properties
      featuredRentProperties.assignAll(fRentProperties);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchSaleProperties() async {
    try {
      // show loader while loading products
      isLoading.value = true;
      //fetch properties
      final fSaleProperties =
          await propertyRepository.getFeaturedSalesProperties();
      //Assign Properties
      featuredSaleProperties.assignAll(fSaleProperties);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// function for retrieving shortlets
  void fetchShortProperties() async {
    try {
      // show loader while loading products
      isLoading.value = true;
      //fetch properties
      final fShortProperties =
      await propertyRepository.getFeaturedShortLetProperties();
      //Assign Properties
      featuredShortLetProperties.assignAll(fShortProperties);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchAllProperties() async {
    try {
      // show loader while loading products
      isLoading.value = true;
      //fetch properties
      final getAProperties = await propertyRepository.getAllSaleProperties();
      //Assign Properties
      allProperties.assignAll(getAProperties);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchAllSaleProperties() async {
    try {
      // show loader while loading products
      isLoading.value = true;
      //fetch properties
      final aSaleProperties = await propertyRepository.getAllSaleProperties();
      //Assign Properties
      allSaleProperties.assignAll(aSaleProperties);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchAllRentProperties() async {
    try {
      // show loader while loading products
      isLoading.value = true;
      //fetch properties
      final aRentProperties = await propertyRepository.getAllRentProperties();
      //Assign Properties
      allRentProperties.assignAll(aRentProperties);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

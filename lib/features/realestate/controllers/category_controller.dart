import 'package:get/get.dart';
import 'package:realestateapi/features/realestate/models/category_model.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';
import 'package:realestateapi/utils/popups/loaders.dart';
import 'package:realestateapi/utils/repository/category_repository.dart';
import 'package:realestateapi/utils/repository/property_repository.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final _propertyRepo = Get.put(PropertyRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

// Load Category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;
      // Fetch categories from data source (Firebase. API, etc.)
      final categories = await _categoryRepository.getAllCategories();
      // update the category list
      allCategories.assignAll(categories);

      // Filter featured Categories
      featuredCategories
          .assignAll(allCategories.where((category) => category.isFeatured));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove the Loader
      isLoading.value = false;
    }
  }

  // Load Selected Category Data

  // Get Category properties
  Future<List<PropertyModel>> getCategoryProperties(
      {required String categoryId, int limit = 6}) async {
    // Fetch limited 6 properties against each category
    try {
      final properties = await _propertyRepo.getPropertyByCategory(categoryId);
      
      return properties;
      
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}

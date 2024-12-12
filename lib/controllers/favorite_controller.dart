import 'dart:convert';
import 'package:get/get.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';
import 'package:realestateapi/utils/popups/loaders.dart';
import 'package:realestateapi/utils/repository/property_repository.dart';
import '../features/local_storage/storage_utility.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  //Initialize Favorites
  Future<void> initFavorites() async {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String id) {
    return favorites[id] ?? false;
  }

  void toggleFavoriteProperty(String id) {
    if (!favorites.containsKey(id)) {
      favorites[id] = true;
      saveFavoritesToStorage();
      TLoaders.customToast(
        message: 'This Property has been added to the Wishlist',
      );
    } else {
      TLocalStorage.instance().removeData(id);
      favorites.remove(id);
      saveFavoritesToStorage();
      favorites.refresh();
      TLoaders.customToast(
        message: 'This Property has been removed from the Wishlist',
      );
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<PropertyModel>> favoriteProperties() async {
    return await PropertyRepository.instance
        .getAllFavouritesPropertys(favorites.keys.toList());
  }
}

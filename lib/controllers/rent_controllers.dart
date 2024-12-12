import 'package:flutter/material.dart';
import 'package:realestateapi/model/post.dart';
import 'package:realestateapi/model/properties.dart';
import 'package:realestateapi/data/services/rent_services.dart';

class RentController extends ChangeNotifier {
  bool isLoading = false;

  List<Property> sales = [];
  List<Post> posts = [];

  RentController() {
    fetchSaleProperties();
    fetchBlogPosts();
  }

  Future<void> fetchSaleProperties() async {
    isLoading = true;
    notifyListeners();
    sales = (await RentServices.fetchSaleProperties())!;
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchBlogPosts() async {
    isLoading = true;
    notifyListeners();
    posts = (await RentServices.getAllPosts())!;
    isLoading = false;
    notifyListeners();
  }
}

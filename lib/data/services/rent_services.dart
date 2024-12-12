import 'package:dio/dio.dart';
import 'package:realestateapi/model/post.dart';
import 'package:realestateapi/model/properties.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants/constants.dart';

class RentServices {
  static var dio = Dio();

  static Future<List<Property>?> fetchSaleProperties() async {
    var response = await dio.get(rentUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((item) => Property.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load Sales Properties");
    }
  }

  static Future<List<Post>?> getAllPosts() async {
    var response = await dio.get(postUrl);
    if (response.statusCode == 200) {
      final List<dynamic> blog = response.data;
      return blog.map((item) => Post.fromJson(item)).toList();
    } else {
      throw Exception("Blog Posts Failed to Load");
    }
  }

  Future<List<Property>?> getRentProperties() async {
    var client = http.Client();

    var uri = Uri.parse(rentUrl);

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;

      return propertyFromJson(json);
    } else {
      throw Exception("Failed to Load");
    }
  }
}

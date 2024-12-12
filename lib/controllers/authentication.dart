import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:realestateapi/utils/constants/constants.dart';
import 'package:realestateapi/utils/popups/loaders.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;

  Future register({
    required String name,
    required String email,
    required String password,
    required String roles,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'name': name,
        'email': email,
        'password': password,
        'roles': roles,
      };

      var response = await http.post(
        Uri.parse(registerUrl),
        headers: {'Accept': 'application/json'},
        body: data,
      );

      if (response.statusCode == 201) {
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      return TLoaders.errorSnackBar(title: 'Oh Snap!!!', message: e.toString());
    }
  }
}

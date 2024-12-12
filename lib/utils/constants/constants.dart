// ignore_for_file: library_private_types_in_public_api

import 'package:intl/intl.dart';

const rentUrl = "https://shelterplug.com/api/property";
const postUrl = "https://shelterplug.com/api/posts";
String registerUrl = "https://shelterplug.com/api/register";
String loginUrl = "https://shelterplug.com/api/login";

String formatCurrency(num amount, {int decimalCount = 0}) {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'en-NG', decimalDigits: decimalCount);
  return formatCurrency.format(amount);
}

 
class ApiEndPoints{
  static const String baseUrl = "https://shelterplug.com/api/";
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
  static _OtherEndPoints otherEndPoints = _OtherEndPoints();
}

class _OtherEndPoints {
  final String movers = 'movers';
  final String locations = 'locations';
  final String vendors = 'vendors';
  final String interiormanager = 'interiormanager';
  final String propertymanagers = 'propertymanagers';
}
 

class _AuthEndPoints {
    final String registerEmail = 'register';
    final String loginEmail = 'login';
    final String propertyUrl = 'property';
  }
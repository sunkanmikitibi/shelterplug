
//import 'package:get_storage/get_storage.dart';

class TValidator {

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null;

  }

  static String? validatePhoneNumber(String? value) {
    if(value == null || value.isEmpty) {
      return 'Phone Number is required';
    }

    final phoneRegExp = RegExp(r'^\d{11}$');

    if(!phoneRegExp.hasMatch(value)) {
      return 'Invalid Phone Number Format';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    //
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid Email Address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    //check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    //check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one Capital letter.';
    }

    //check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one Number.';
    }

    //check for special Characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?:{}|<>]'))) {
      return 'Password must contain at least one Special Character.';
    }

    return null;
  }
}

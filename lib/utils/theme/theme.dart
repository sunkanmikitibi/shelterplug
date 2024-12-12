import 'package:flutter/material.dart';
import 'package:realestateapi/utils/theme/custom_themes/appbar_theme.dart';
import 'package:realestateapi/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:realestateapi/utils/theme/custom_themes/card_theme.dart';
import 'package:realestateapi/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:realestateapi/utils/theme/custom_themes/text_field_theme.dart';

import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_theme.dart';

class SheltherTheme {
  SheltherTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    cardTheme: TCard.lightCardTheme,
    primaryColor: Colors.blue,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    textTheme: TTextTheme.lightTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    cardTheme: TCard.darkCardTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    primaryColor: Colors.blue,
    appBarTheme: TAppBarTheme.darktAppBarTheme,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}

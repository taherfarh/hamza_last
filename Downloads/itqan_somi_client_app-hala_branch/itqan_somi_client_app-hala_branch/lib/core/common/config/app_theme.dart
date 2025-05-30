import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

String fontFamily = "Cairo-Regular";

class AppThemes {

  AppThemes._internal();

  static final ThemeData lightThemeData = ThemeData(
      tabBarTheme: TabBarTheme(
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.primaryColor.withOpacity(0.4)),
      brightness: Brightness.light,
      fontFamily: fontFamily,
      primaryColor: AppColors.primaryColor,
      checkboxTheme: const CheckboxThemeData(
          side: BorderSide(
            color: AppColors.primaryColor,
          )),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primaryColor,
      ),
      scaffoldBackgroundColor: AppColors.white,
      // elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          foregroundColor: AppColors.black,
          //     titleTextStyle: TextStyle(color: AppColors.black),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          color: Colors.transparent),
      // cardTheme: cardTheme,
      chipTheme: const ChipThemeData(
          deleteIconColor: AppColors.primaryColor,
          selectedColor: AppColors.primaryColor,
          backgroundColor: AppColors.white,
          side: BorderSide(color: AppColors.primaryColor, width: 1.5),
          labelStyle: TextStyle(color: AppColors.primaryColor)),
      // primarySwatch: AppColors.accent as MaterialColor,
      colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: AppColors.primaryColor,
          secondary: AppColors.grey,
          primaryContainer: AppColors.white,
          onSecondary: AppColors.primaryColor));



}

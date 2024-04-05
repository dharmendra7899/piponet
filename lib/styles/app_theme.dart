import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: appColors.colorBackground,
    primaryColor: appColors.colorPrimary,
    fontFamily: 'Inter',
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 1,
      elevation: 3,
      shadowColor: appColors.borderColor,
      surfaceTintColor: Colors.white,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: appColors.colorBackground,
      surfaceTintColor: appColors.colorBackground,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: appColors.colorBackground,
      surfaceTintColor: appColors.colorBackground,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
          fontFamily: "Inter"),
      bodyMedium: TextStyle(
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter"),
      bodySmall: TextStyle(
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
          fontFamily: "Inter"),
      titleMedium: TextStyle(
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter"),
      titleSmall: TextStyle(
          color: appColors.textColor,
          fontWeight: FontWeight.w300,
          fontFamily: "Inter"),
      titleLarge: TextStyle(
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
          fontFamily: "Inter"),
    ),
    cardTheme: CardTheme(
      color: appColors.colorBackground,
      surfaceTintColor: appColors.colorBackground,
    ),
    indicatorColor: appColors.appBlack,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: appColors.appBlack,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: appColors.appBlack,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle:
          TextStyle(color: appColors.appGray, fontWeight: FontWeight.w400),
      labelStyle:
          TextStyle(color: appColors.appGray, fontWeight: FontWeight.w500),
      floatingLabelStyle:
          TextStyle(color: appColors.appBlack, fontWeight: FontWeight.w400),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: appColors.appBlack,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: appColors.appBlack),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: appColors.colorPrimary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: appColors.colorPrimary),
      ),
    ),
  );
}

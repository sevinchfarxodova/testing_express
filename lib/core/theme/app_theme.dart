import 'package:flutter/material.dart';
import '../constants/colors/app_colors.dart';
import '../styles/app_text_style.dart';
import '../utils/responsiveness/app_responsive.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.dark,
    colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Colors.transparent,
        onPrimary: AppColors.white,
        secondary: Color(0xFF1A1A1A),
        onSecondary: Colors.transparent,
        error: Colors.red,
        onError: Colors.red,
        surface: Color(0xFF151515),
        onSurface: Colors.transparent,
        outline: AppColors.c242424,  //Alert dialog delete btn border color
        scrim: AppColors.black,  //Alert dialog background color
        outlineVariant: AppColors.c242424  //TextFormField border color
    ),
    splashColor: AppColors.c5F5F5F,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyle.nunitoMedium.copyWith(
        color: AppColors.white.withValues(alpha: 0.5),
        fontSize: 18,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.white,
          width: appW(1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.white,
          width: appW(2),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.red,
          width: appW(1),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.red,
          width: appW(2),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleMedium: AppTextStyle.nunitoMedium.copyWith(
        color: AppColors.white,
      ),
      titleLarge: AppTextStyle.nunitoRegular.copyWith(
        color: AppColors.white,
      ),
      titleSmall: AppTextStyle.nunitoLight.copyWith(
        color: AppColors.white,
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.transparent,
      onPrimary: AppColors.black,
      secondary: Colors.white,
      onSecondary: Colors.transparent,
      error: Colors.red,
      onError: Colors.red,
      surface: Color(0xFFFFFFFF).withValues(alpha: 0.25),
      onSurface: Colors.transparent,
      outline: AppColors.cE8E8E8,  //Alert dialog delete btn border color
      scrim: Colors.white,  //Alert dialog background color
      outlineVariant: AppColors.c242424.withValues(alpha: 0.2),  //TextFormField border color

    ),
    splashColor: Color(0xFF3C3C3C).withValues(alpha: 0.05),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyle.nunitoMedium.copyWith(
        color: AppColors.black.withValues(alpha: 0.4),
        fontSize: 18,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Color(0xFF242424),
          width: appW(1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Color(0xFF242424),
          width:appW(2),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.red,
          width: appW(1),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.red,
          width: appW(2),
        ),
      ),
    ),
    canvasColor: Color(0xFFECECEC),
    textTheme: TextTheme(
      titleMedium: AppTextStyle.nunitoMedium.copyWith(
        color: AppColors.black,
      ),
      titleLarge: AppTextStyle.nunitoRegular.copyWith(
        color: AppColors.black,
      ),
      titleSmall: AppTextStyle.nunitoLight.copyWith(
        color: AppColors.black,
      ),
    ),
     );

  static BoxDecoration themedBoxDecoration(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
        color: isDark
            ? AppColors.c151515.withValues(alpha: 0.1)
            : AppColors.c151515.withValues(alpha: 0),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isDark
              ? AppColors.c5F5F5F.withValues(alpha: 0.4)
              : AppColors.c5F5F5F.withValues(alpha: 0.2),
          width: appW(1),
        ));
  }
}

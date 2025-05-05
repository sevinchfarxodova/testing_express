import 'package:flutter/material.dart';
import '../constants/colors/app_colors.dart';

sealed class AppTextStyle {
  AppTextStyle._();

  // Nunito
  static TextStyle nunitoThin = const TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w200,
    color: AppColors.white,
  );

  static TextStyle nunitoLight = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w300,
    color: AppColors.white,
  );

  static TextStyle nunitoRegular = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle nunitoMedium = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static TextStyle nunitoSemiBold = const TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle nunitoBold = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle nunitoBlack = const TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w800,
    color: AppColors.white,
  );
}

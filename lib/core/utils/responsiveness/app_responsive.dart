import 'package:flutter/material.dart';

double appH(double number) => AppResponsive.height(number);

double appW(double number) => AppResponsive.width(number);

class AppResponsive {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
  }

  static double height(double number) => (number / 926) * screenHeight;

  static double width(double number) => (number / 428) * screenWidth;


}

extension ResponsiveSizeExtension on num {
  /// Returns a SizedBox with responsive width
  SizedBox get getW => SizedBox(width: AppResponsive.width(toDouble()));

  /// Returns a SizedBox with responsive height
  SizedBox get getH => SizedBox(height: AppResponsive.height(toDouble()));
}

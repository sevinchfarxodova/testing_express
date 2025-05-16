
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../data/model/test_enum.dart';

class CountItem extends StatelessWidget {
  const CountItem({
    super.key,
    required this.title,
    this.isActive = true,
    this.testStatus = TestStatus.pure,
    this.isFirst = false,
    this.isLast = false,
    this.beforeEndTestStatus,
    this.nextTestStatus,
  });

  final String title;
  final bool isActive;
  final TestStatus testStatus;
  final bool isFirst;
  final bool isLast;
  final TestStatus? beforeEndTestStatus;
  final TestStatus? nextTestStatus;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.transparent;
    Color titleColor = Theme.of(context).colorScheme.onPrimary;
    BorderRadius borderRadius = BorderRadius.circular(10.r);

    bool isLight = Theme.of(context).brightness == Brightness.light;

    if (isActive) {
      backgroundColor = Color(0xFF3C3C3C).withValues(alpha: 0.65);
      if (isLight) titleColor = AppColors.white;
    } else if (testStatus == TestStatus.trueAnswer) {
      backgroundColor = AppColors.c2DC937;
      if (isLight) titleColor = AppColors.white;
    } else if (testStatus == TestStatus.wrongAnswer) {
      backgroundColor = Color(0xFFCC3232);
      if (isLight) titleColor = AppColors.white;
    }

    if (beforeEndTestStatus == null) {
      borderRadius = BorderRadius.only(
        topLeft: Radius.circular(10.r),
        bottomLeft: Radius.circular(10.r),
      );
      if (!(nextTestStatus != null && TestStatus.pure != nextTestStatus)) {
        borderRadius = BorderRadius.circular(10.r);
      }
    } else {
      if (nextTestStatus != null && TestStatus.pure != nextTestStatus) {
        borderRadius = BorderRadius.only(
          topLeft: Radius.circular(10.r),
          bottomLeft: Radius.circular(10.r),
        );
        if (TestStatus.pure != beforeEndTestStatus) {
          borderRadius = BorderRadius.zero;
        }
      } else {
        borderRadius = BorderRadius.only(
          topRight: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        );
        if (TestStatus.pure == beforeEndTestStatus) {
          borderRadius = BorderRadius.circular(10.r);
        }
      }
    }

    if (isActive) {
      borderRadius = BorderRadius.circular(10.r);
    }

    return Container(
      alignment: Alignment.center,
      width: appH(51),
      height: appH(51),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Text(
        title,
        style: AppTextStyle.nunitoRegular.copyWith(
          fontSize: 20.sp,
          color: titleColor,
        ),
      ),
    );
  }
}


import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/styles/app_text_style.dart';

class TestItem extends StatelessWidget {
  const TestItem({
    super.key,
    this.isActive = false,
    this.isError = false,
    this.onTab,
    required this.title, required this.leadingTitle,
  });

  final bool isActive;
  final bool isError;
  final VoidCallback? onTab;
  final String title;
  final String leadingTitle;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).splashColor;
    Color iconColor = AppColors.c2DC937;
    Color titleColor =
        Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.8);

    bool isLight = Theme.of(context).brightness == Brightness.light;

    if (isActive) {
      backgroundColor = Color(0xFF10A019).withValues(alpha: 0.5);
      if (isLight) {
        titleColor = AppColors.white.withValues(alpha: 0.8);
      }
    } else if (isError) {
      backgroundColor = Color(0xFFCC3232).withValues(alpha: 0.5);
      iconColor = Color(0xFFFF0303);

      if (isLight) {
        titleColor = AppColors.white.withValues(alpha: 0.8);
      }
    }

    return GestureDetector(
      onTap: onTab,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: appH(4)),
        padding: EdgeInsets.symmetric(horizontal: appW(12), vertical: appH(8)),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$leadingTitle.",

              style: AppTextStyle.nunitoRegular.copyWith(
                fontSize: 16.sp,
                color: isActive || isError
                    ? titleColor
                    : Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withValues(alpha: 0.3),
              ),
            ),
            7.getW,
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.nunitoRegular.copyWith(
                  fontSize: 20.sp,
                  color: isActive || isError
                      ? titleColor
                      : Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withValues(alpha: 0.8),
                ),
              ),
            ),
            if (isActive || isError)
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(appW(4)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: iconColor,
                    width: appW(2),
                  ),
                ),
                child: SvgPicture.asset(
                  isActive ? AppIcons.check  : AppIcons.close,
                  width: appW(14),
                  height: appH(14),
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

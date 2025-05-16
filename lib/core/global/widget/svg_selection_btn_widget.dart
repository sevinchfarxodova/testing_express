import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/app_text_style.dart';

class SvgSelectionBtnWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? opacity;
  final String? leadingIconPath;
  final String? actionIconPath;
  final Color? titleColor;
  final bool? isSelected;

  const SvgSelectionBtnWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.opacity,
    this.leadingIconPath,
    this.actionIconPath,
    this.titleColor,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: AppResponsive.screenWidth,
        height: 48.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Theme.of(context).colorScheme.surface.withValues(alpha: opacity),
              border: Border.all(
                color: Theme.of(context).colorScheme.outlineVariant,
                width: 1.w,
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                if (leadingIconPath != null) SvgPicture.asset(leadingIconPath!),
                5.getW,
                Text(
                  title,
                  style: AppTextStyle.nunitoRegular.copyWith(
                    fontSize: 18.sp,
                    color:
                        titleColor ?? Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Spacer(),
                if (actionIconPath != null) SvgPicture.asset(actionIconPath!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

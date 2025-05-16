
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/extension/size_extension.dart';

class ChosenTileWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final String leadingIconPath;
  final double? opacity;
  final String? actionIconPath;

  const ChosenTileWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.leadingIconPath,
    this.opacity,
    this.actionIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: 48.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color:
                  Theme.of(context).colorScheme.surface.withValues(alpha: 0.3),
              border: Border.all(
                color: Theme.of(context).colorScheme.outlineVariant,
                width: 1.we,
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                if ([".svg", ".png"].any(leadingIconPath.endsWith))
                  leadingIconPath.endsWith(".svg")
                      ? SvgPicture.asset(leadingIconPath)
                      : Image.asset(leadingIconPath),
                5.getW(),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18.sp,
                      ),
                ),
                Spacer(),
                if (isSelected) SvgPicture.asset(actionIconPath!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: 48.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: opacity == null
                  ? AppColors.c151515
                  : AppColors.c151515.withValues(alpha: opacity),
              border: Border.all(
                color: AppColors.c242424,
                width: 1.w,
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                if (leadingIconPath != null) SvgPicture.asset(leadingIconPath!),
                5.getW(),
                Text(
                  title,
                  style: AppTextStyle.nunitoRegular.copyWith(
                    fontSize: 18.sp,
                    color:
                        titleColor ?? AppColors.white.withValues(alpha: 0.75),
                  ),
                ),
                Spacer(),
                if (isSelected) SvgPicture.asset(actionIconPath!),
              ],
            ),
          ),
        ),
      ),
    );

 */

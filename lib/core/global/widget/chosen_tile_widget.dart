import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        width: AppResponsive.screenWidth,
        height: 48.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color:
                  Theme.of(context).colorScheme.surface.withValues(alpha: 0.3),
              border: Border.all(
                color: Theme.of(context).colorScheme.outlineVariant,
                width: appW(1),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                if ([".svg", ".png"].any(leadingIconPath.endsWith))
                  leadingIconPath.endsWith(".svg")
                      ? SvgPicture.asset(leadingIconPath)
                      : Image.asset(leadingIconPath),
                5.getW,
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



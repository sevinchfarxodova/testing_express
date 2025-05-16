
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/extension/size_extension.dart';
import '../../core/styles/app_text_style.dart';

class PngSelectionBtnWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? opacity;
  final String? leadingIconPath;
  final String? actionIconPath;
  final Color? circleColor;
  final Color? backgroundColor;

  const PngSelectionBtnWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.opacity,
    this.leadingIconPath,
    this.actionIconPath,
    this.circleColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context)
                .colorScheme
                .surface
                .withValues(alpha: opacity),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
              width: 1.w,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.we),
            child: Row(
              children: [
                if (leadingIconPath != null)
                  Image.asset(
                    leadingIconPath!,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                5.getW(),
                Text(
                  title,
                  style: AppTextStyle.nunitoRegular.copyWith(
                    fontSize: 18.sp,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withValues(alpha: 0.85),
                  ),
                ),
                Spacer(),
                if (actionIconPath != null && circleColor != null)
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2.we,
                        color: circleColor ?? Colors.transparent,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.we),
                      child: SvgPicture.asset(
                        actionIconPath!,
                        colorFilter: ColorFilter.mode(
                          circleColor ?? Colors.transparent,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                if (actionIconPath != null && circleColor == null)
                  SvgPicture.asset(
                    actionIconPath!,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

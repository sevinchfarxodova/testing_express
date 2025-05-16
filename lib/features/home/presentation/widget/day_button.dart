
import 'package:express_testing/core/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/colors/app_colors.dart';

class DayButton extends StatelessWidget {
  const DayButton({
    super.key,
    this.isActive = false,
    this.onTab,
  });

  final bool isActive;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTab,
      child: SizedBox(
        width: 87.we,
        height: 86.he,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              alignment: Alignment.center,
              width: 83.we,
              height: 83.we,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.c054649
                    : isDark
                        ? AppColors.c1E1E1E
                        : Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.c5F5F5F.withValues(alpha: 0.4),
                  width: 1.we,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "11",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16.sp,
                        color: isActive ? AppColors.white : null),
                  ),
                  Text(
                    "Январь",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16.sp,
                        color: isActive ? AppColors.white : null),
                  ),
                ],
              ),
            ),
            if (isActive)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  alignment: Alignment.center,
                  width: 20.we,
                  height: 20.we,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: SvgPicture.asset(
                    AppIcons.check,
                    width: 12.we,
                    height: 12.we,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

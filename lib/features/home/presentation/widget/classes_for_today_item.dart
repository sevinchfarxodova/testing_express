import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../languages/locale_keys.g.dart';

class ClassesForTodayItem extends StatelessWidget {
  const ClassesForTodayItem({
    super.key,
    this.isShowBottomLiner = true,
    this.isActive = false,
    this.onTab,
  });

  final bool isShowBottomLiner;
  final bool isActive;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color colorBack = Color(0xFF151515).withValues(alpha: 0.1);

    if (isDarkMode) {
      colorBack = Color(0xFF151515);
    }

    return GestureDetector(
      onTap: onTab,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.he),
            padding: EdgeInsets.all(20.we),
            decoration: BoxDecoration(
              color: isActive ? colorBack : Colors.transparent,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.homeVideo,
                  width: 24.we,
                  height: 24.we,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                6.getW(),
                Expanded(
                  child: Text(
                    LocaleKeys.video_lessons.tr(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 18.sp,
                        ),
                  ),
                ),
                Text(
                  "15%",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18.sp,
                      ),
                ),
                9.getW(),
                DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActive ? AppColors.c00D8A5 : AppColors.white,
                      width: 2.we,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6.we),
                    child: SvgPicture.asset(
                      AppIcons.check,
                      width: 14.we,
                      height: 14.we,
                      colorFilter: ColorFilter.mode(
                        isActive ? AppColors.c00D8A5 : AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isShowBottomLiner)
            Container(
              width: (width - 70.we),
              height: 1.he,
              color: Color(0xFF2B2B2B),
            ),
        ],
      ),
    );
  }
}

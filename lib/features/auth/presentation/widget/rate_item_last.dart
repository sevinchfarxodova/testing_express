import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../languages/locale_keys.g.dart';

class RateItemLast extends StatelessWidget {
  const RateItemLast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(20)),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Color(0xFF5F5F5F).withValues(alpha: 0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.premium,
                width: appW(24),
                height: appH(24),
              ),
              6.getW,
              Text(
                LocaleKeys.premium_title.tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 26.sp,
                ),
              ),
            ],
          ),
          6.getH,
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.check,
                width: appW(18),
                height: appH(18),
              ),
              12.getW,
              Expanded(
                child: Text(
                  LocaleKeys.premium_sub_title_1.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          4.getH,
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.check,
                width: appW(18),
                height: appH(18),
              ),
              12.getW,
              Expanded(
                child: Text(
                  LocaleKeys.premium_sub_title_2.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          4.getH,
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.check,
                width: appW(18),
                height: appH(18),
              ),
              12.getW,
              Expanded(
                child: Text(
                  LocaleKeys.premium_sub_title_3.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

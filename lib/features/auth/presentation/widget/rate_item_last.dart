import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/extension/size_extension.dart';
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
      padding: EdgeInsets.all(20.we),
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
                width: 24.we,
                height: 24.we,
              ),
              6.getW(),
              Text(
                LocaleKeys.premium_title.tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 26.sp,
                ),
              ),
            ],
          ),
          6.getH(),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.check,
                width: 18.we,
                height: 18.we,
              ),
              12.getW(),
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
          4.getH(),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.check,
                width: 18.we,
                height: 18.we,
              ),
              12.getW(),
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
          4.getH(),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.check,
                width: 18.we,
                height: 18.we,
              ),
              12.getW(),
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

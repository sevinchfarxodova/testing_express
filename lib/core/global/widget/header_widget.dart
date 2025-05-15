import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../languages/locale_keys.g.dart';
import '../../constants/app_icons.dart';

class HeaderWidget extends StatelessWidget {

  final VoidCallback? onTap;
  final VoidCallback? onTapBack;

  const HeaderWidget({
    super.key,
    this.onTap,
    this.onTapBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onTapBack != null)
          GestureDetector(
            onTap: onTapBack,
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.arrow,
                  width: appW(32),
                  height: appH(32),
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                4.getW,
                Text(
                  LocaleKeys.back.tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
              ],
            ),
          ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                "",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 19.sp,
                    ),
              ),
              5.getW,
              SvgPicture.asset(
                AppIcons.profileUser,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

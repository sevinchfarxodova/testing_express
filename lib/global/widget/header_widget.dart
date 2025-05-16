import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_icons.dart';
import '../../languages/locale_keys.g.dart';

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
                  width: 32.we,
                  height: 32.we,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                4.getW(),
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
                "Хатамов Н",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 19.sp,
                    ),
              ),
              5.getW(),
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

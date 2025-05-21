import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/global/widget/main_background.dart';
import '../../../../core/global/widget/png_selection_btn_widget.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/navigation_service.dart';
import '../../../../languages/locale_keys.g.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: appW(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                20.getH,
                Text(
                  LocaleKeys.payment_by.tr(),
                  textAlign: TextAlign.left,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 22.sp),
                ),
                14.getH,
                PngSelectionBtnWidget(
                  title: "Payme",
                  onTap: onTap,
                  leadingIconPath: AppImages.payme,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  // actionIconPath: AppIcons.chevronRight,
                ),
                10.getH,
                PngSelectionBtnWidget(
                  title: "Click",
                  onTap: onTap,
                  leadingIconPath: AppImages.click,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
                10.getH,
                PngSelectionBtnWidget(
                  title: LocaleKeys.by_admin.tr(),
                  onTap: onTap,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTap() {
    NavigationService.instance.pushNamed(routeName: AppRoutesNames.home);
  }
}

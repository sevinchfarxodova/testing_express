import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/global/widget/custom_btn_widget.dart';
import '../../../../core/global/widget/main_background.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/navigation_service.dart';
import '../../../../languages/locale_keys.g.dart';
import '../widget/decorated_box.dart';

class MustPayScreen extends StatelessWidget {
  const MustPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: appW(15)),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
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
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          6.getH,
                          MyDecoratedBox(title: LocaleKeys.users_5520.tr()),
                          15.getH,
                          Text(
                            LocaleKeys.space_advertising.tr(),
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge?.copyWith(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.32,
                      child: Column(
                        children: [
                          40.getH,
                          Image.asset(AppImages.userIcon, width: width * 0.15),
                          MyDecoratedBox(title: "Fazel"),
                        ],
                      ),
                    ),
                  ],
                ),
                20.getH,
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        isDarkMode
                            ? AppImages.car3dIcon
                            : AppImages.car3dIconLight,
                        width: 220.r,
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          170.getH,
                          Text(
                            LocaleKeys.payment.tr(),
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(
                              fontSize: 46.sp,
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimary.withValues(alpha: 0.95),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.75,
                            child: Text(
                              LocaleKeys.pay_to_use.tr(),
                              textAlign: TextAlign.center,
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                fontSize: 20.sp,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimary.withValues(alpha: 0.85),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: MyDecoratedBox(title: LocaleKeys.received_420.tr()),
                ),
                Spacer(),
                CustomBtnWidget(
                  onTap: () {
                    NavigationService.instance.pushReplacementNamed(
                      routeName: AppRoutesNames.ratePage,
                    );
                  },
                  btnText: LocaleKeys.contact_admin.tr(),
                  titleColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                10.getH,
                CustomBtnWidget(
                  onTap: () {
                    NavigationService.instance.pushNamed(
                      routeName: AppRoutesNames.ratePage,
                    );
                  },
                  btnText: LocaleKeys.pay.tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

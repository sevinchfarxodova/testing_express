import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/global/widget/custom_btn_widget.dart';
import '../../../../core/global/widget/main_background.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/navigation_service.dart';
import '../../../../languages/locale_keys.g.dart';

class TestUserScreen extends StatelessWidget {
  const TestUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250.r,
                        height: 220.r,
                        child: Image(
                          image: AssetImage(
                            AppImages.taxometrIcon,
                          ),
                        ),
                      ),
                      Text(
                        LocaleKeys.select_level.tr(),
                        textAlign: TextAlign.center,
                        style:
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 36.sp,
                        ),
                      ),
                      Text(
                        LocaleKeys.training_plan.tr(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withValues(
                            alpha: 0.75,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      child: Text(
                        LocaleKeys.your_level.tr(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 19.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withValues(
                            alpha: 0.75,
                          ),
                        ),
                      ),
                    ),
                    12.getH,
                    CustomBtnWidget(
                      onTap: () {
                        NavigationService.instance.pushNamed(
                          routeName: AppRoutesNames.mustPay,
                        );
                      },
                      btnText: LocaleKeys.beginner.tr(),
                      icon: Icons.sentiment_neutral_outlined,
                    ),
                    10.getH,
                    CustomBtnWidget(
                      onTap: () {
                        NavigationService.instance.pushNamed(
                          routeName: AppRoutesNames.mustPay,
                        );
                      },
                      btnText: LocaleKeys.experience.tr(),
                      icon: Icons.sentiment_satisfied_alt,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

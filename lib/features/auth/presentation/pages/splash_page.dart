import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/global/widget/main_background.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/navigation_service.dart';
import '../../../../languages/locale_keys.g.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      //  String userToke = StorageRepository.getString(key: "access_token");
      NavigationService.instance.pushNamedAndRemoveUntil(
        routeName: AppRoutesNames.login,
        // userToke.isNotEmpty ? AppRoutesNames.home : AppRoutesNames.login,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: MainBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 170.r,
              height: 170.r,
              child: Image.asset(AppImages.splashIcon),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 14.h),
              child: Text(
                textAlign: TextAlign.center,
                LocaleKeys.splash_text.tr(),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontSize: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

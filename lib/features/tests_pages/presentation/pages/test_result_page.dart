import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/global/widget/custom_btn_widget.dart';
import '../../../../core/global/widget/header_widget.dart';
import '../../../../core/global/widget/main_background.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/navigation_service.dart';
import '../../../../languages/locale_keys.g.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    super.key,
    required this.countTrueAnswer,
    required this.lengthTest,
  });

  final int countTrueAnswer;
  final int lengthTest;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String get resultStatus {
    final score = widget.countTrueAnswer / widget.lengthTest;
    if (score >= 0.8) return LocaleKeys.great.tr();
    if (score >= 0.5) return LocaleKeys.good.tr(); // Add to LocaleKeys
    return LocaleKeys.try_again.tr(); // Add to LocaleKeys
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: appW(15)),
            child: Column(
              children: [
                HeaderWidget(
                  onTap: () {
                    NavigationService.instance
                        .pushNamed(routeName: AppRoutesNames.profile);
                  },
                  onTapBack: () => Navigator.pop(context),
                ),
                30.getH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.test_results.tr(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 22.sp,
                      ),
                    ),
                    Text(
                      DateFormat("dd-MMMM", 'ru').format(DateTime.now()),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                40.getH,
                Image.asset(
                  AppImages.resultTest,
                  width: appW(234),
                  height: appH(200),
                ),
                Text(
                  "${widget.countTrueAnswer}/${widget.lengthTest}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 56.sp,
                    height: 0,
                  ),
                ),
                Text(
                  resultStatus,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 36.sp,
                    height: 0,
                  ),
                ),
                10.getH,
                Text(
                  LocaleKeys.finish.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 23.sp,
                  ),
                ),
                const Spacer(),
                CustomBtnWidget(
                  backgroundColor: Theme.of(context).splashColor,
                  titleColor: Theme.of(context).colorScheme.onPrimary,
                  btnText: LocaleKeys.test_again.tr(),
                  onTap: () {
                    NavigationService.instance.pushNamedAndRemoveUntil(
                      routeName: AppRoutesNames.testPage,
                    );
                  },
                ),
                12.getH,
                CustomBtnWidget(
                  btnText: LocaleKeys.return_to_main.tr(),
                  onTap: () {
                    NavigationService.instance.pushNamedAndRemoveUntil(
                      routeName: AppRoutesNames.home,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

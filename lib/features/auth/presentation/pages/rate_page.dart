import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/navigation_service.dart';
import '../../../../global/widget/custom_btn_widget.dart';
import '../../../../global/widget/main_background.dart';
import '../../../../languages/locale_keys.g.dart';
import '../widget/rate_item_first.dart';
import '../widget/rate_item_last.dart';

class RatePage extends StatefulWidget {
  const RatePage({super.key});

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.we),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        AppIcons.arrow,
                        width: 32.we,
                        height: 32.we,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Text(
                      LocaleKeys.choose_tariff.tr(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(),
                    SizedBox(),
                  ],
                ),
                15.getH(),
                RateItemFirst(),
                5.getH(),
                CustomBtnWidget(
                  btnText: LocaleKeys.pay_standard.tr(),
                  onTap: () {
                    NavigationService.instance.pushNamed(
                      routeName: AppRoutesNames.themePage,
                    );
                  },
                ),
                20.getH(),
                RateItemLast(),
                5.getH(),
                CustomBtnWidget(
                  btnText: LocaleKeys.pay_premium.tr(),
                  onTap: () {
                    NavigationService.instance.pushNamed(
                      routeName: AppRoutesNames.themePage,
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

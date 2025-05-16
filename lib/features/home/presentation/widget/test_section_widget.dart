import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/navigation_service.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../global/widget/png_selection_btn_widget.dart';
import '../../../../languages/locale_keys.g.dart';

class TestSectionWidget extends StatelessWidget {
  const TestSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.we),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: Text(
              LocaleKeys.tests.tr(),
              textAlign: TextAlign.left,
              style: AppTextStyle.nunitoMedium.copyWith(
                fontSize: 20.sp,
              ),
            ),
          ),
          10.getH(),
          PngSelectionBtnWidget(
            title: "Тест на C1",
            opacity: 0.6,
            onTap: () => _navigateToScreen(AppRoutesNames.testPage),
            actionIconPath: AppIcons.checkCircle,
            circleColor: AppColors.c00D8A5,
          ),
          5.getH(),
          PngSelectionBtnWidget(
            title: "Тест на C2",
            onTap: () => _navigateToScreen(AppRoutesNames.testPage),
            actionIconPath: AppIcons.chevronRight,
          ),
          5.getH(),
          PngSelectionBtnWidget(
            title: "Тест на C3",
            onTap: () => _navigateToScreen(AppRoutesNames.testPage),
            actionIconPath: AppIcons.chevronRight,
          ),
        ],
      ),
    );
  }

  void _navigateToScreen(String pathScreen) {
    NavigationService.instance.pushNamed(
      routeName: AppRoutesNames.testPage,
    );
  }
}

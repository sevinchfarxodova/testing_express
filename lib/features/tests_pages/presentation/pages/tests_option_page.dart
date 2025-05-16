import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/constants/colors/app_colors.dart';
import 'package:express_testing/core/global/widget/main_background.dart';
import 'package:express_testing/core/global/widget/png_selection_btn_widget.dart';
import 'package:express_testing/core/routes/app_routes.dart';
import 'package:express_testing/core/routes/navigation_service.dart';
import 'package:express_testing/core/styles/app_text_style.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:express_testing/features/tests_pages/presentation/bloc/tests_event.dart';
import 'package:express_testing/languages/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/test/test_bloc.dart';
import '../bloc/test/test_options_state.dart';

class TestsOptionPage extends StatefulWidget {
  const TestsOptionPage({super.key});

  @override
  State<TestsOptionPage> createState() => _TestsOptionPageState();
}

class _TestsOptionPageState extends State<TestsOptionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      final limit = args?['limit'] ?? 10;
      final offset = args?['offset'] ?? 0;

      context.read<TestBloc>().add(
        FetchTestsEvent(limit: limit, offset: offset),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TestBloc, TestState>(
      listener: (context, state) {
        if (state is TestLoaded) {
          NavigationService.instance.pushNamed(
            routeName: AppRoutesNames.testPage,
            arguments: {'testData': state.testResponse},
          );
        } else if (state is TestError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.message ,
                style: AppTextStyle.nunitoMedium.copyWith(
                  color: AppColors.white,
                  fontSize: 15.sp,
                ),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: MainBackground(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: appW(15)),
              child: Column(
                children: [
                  SizedBox(
                    width: AppResponsive.screenWidth,
                    child: Text(
                      LocaleKeys.tests.tr(),
                      textAlign: TextAlign.left,
                      style: AppTextStyle.nunitoMedium.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  20.getH,
                  PngSelectionBtnWidget(
                    title: "10 Test",
                    opacity: 0.6,
                    onTap: () => _navigateToScreen(10),

                    circleColor: AppColors.c00D8A5,
                  ),
                  18.getH,
                  PngSelectionBtnWidget(
                    title: "30 Test",
                    opacity: 0.6,
                    onTap: () => _navigateToScreen(30),

                    circleColor: AppColors.c00D8A5,
                  ),
                  18.getH,
                  PngSelectionBtnWidget(
                    title: "50 Test",
                    opacity: 0.6,
                    onTap: () => _navigateToScreen(50),

                    circleColor: AppColors.c00D8A5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToScreen(int limit) {
    NavigationService.instance.pushNamed(
      routeName: AppRoutesNames.testPage,
      arguments: {"limit": limit, "offset": 0},
    );
  }
}

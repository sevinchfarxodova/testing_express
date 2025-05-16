import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/global/widget/header_widget.dart';
import '../../../../core/global/widget/main_background.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/navigation_service.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../languages/locale_keys.g.dart';
import '../../data/model/test_enum.dart';
import '../../domain/usecase/incorrect_attamp_usecase.dart';
import '../../domain/usecase/progress_create_usecase.dart';
import '../bloc/test/test_selection/select_test_state.dart';
import '../bloc/test/test_selection/test_selec_bloc.dart';
import '../bloc/test/test_selection/test_selection_event.dart';
import '../widget/count_view.dart';
import '../widget/test_variants_view.dart';


class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String _currentLanguage = "uz";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locale = context.locale;
      setState(() {
        _currentLanguage = locale.languageCode;
      });
    });
    _setCurrentLanguage();
    _initializeBloc();
  }




  void _setCurrentLanguage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Locale currentLocale = context.locale;
      setState(() {
        _currentLanguage = currentLocale.languageCode;
      });
    });
  }


  void _initializeBloc() {
    final bloc = context.read<TestSelectionBloc>();
    bloc.add(TestSelectionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestSelectionBloc(
        incorrectAttemptsAddCountUseCase: sl<IncorrectAttemptsAddCountUseCase>(),
        progressCreateUseCase: sl<ProgressCreateUseCase>(),
      ),
      child: Builder(
        builder: (context) {
          /// Bloc init qilishdan keyin Scaffold ajratib ishlatyapmiz
          return Scaffold(
            body: MainBackground(
              child: BlocConsumer<TestSelectionBloc, TestSelectionState>(
                listener: (context, state) {
                  if (state is TestSelectionError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          state.message,
                          style: AppTextStyle.nunitoMedium.copyWith(
                            color: AppColors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    );
                  } else if (state is TestSelectionLoaded &&
                      state.currentIndex >= state.testResponse.tests.length) {
                    NavigationService.instance.pushReplacementNamed(
                      routeName: AppRoutesNames.resultPage,
                      arguments: {
                        "count_true_answer": state.testStatuses
                            .where((element) => element == TestStatus.trueAnswer)
                            .length,
                        "length_test": state.testStatuses.length,
                      },
                    );
                  }
                },
                builder: (context, state) {
                  if (state is TestSelectionLoading) {
                    return const Center(child: CupertinoActivityIndicator());
                  }

                  if (state is TestSelectionLoaded &&
                      state.testResponse.tests.isNotEmpty) {
                    return SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: appW(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeaderWidget(
                              onTap: () {},
                              onTapBack: () => Navigator.pop(context),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    30.getH,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LocaleKeys.tests.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(fontSize: 26.sp),
                                        ),
                                        const Text(""),
                                      ],
                                    ),
                                    20.getH,
                                    Text(
                                      "${state.currentIndex + 1} из ${state.testResponse.tests.length}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(fontSize: 22.sp),
                                    ),
                                    15.getH,
                                    Text(
                                      "${state.currentIndex + 1} из ${state.testResponse.tests.length}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(fontSize: 22.sp),
                                    ),
                                    15.getH,
                                    TestVariantsView(
                                      currentLanguage: _currentLanguage,
                                      onChangedSelectVariant: (text, index) {
                                        context.read<TestSelectionBloc>().add(
                                          SelectVariant(
                                            selectedVariantText: text,
                                            selectVariantIndex: index,
                                          ),
                                        );
                                      },
                                      variants: state.testResponse
                                          .tests[state.currentIndex]
                                          .answers[_currentLanguage] ??
                                          [],
                                      isShowTrueAnswer: state.isShowTrueAnswer,
                                      currentTestTrueAnswerIndex:
                                      state.correctVariantIndex ?? -1,
                                      currentTestSelectVariantIndex:
                                      state.selectedVariantIndex ?? -1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Уровень: Нормально",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 16.sp),
                                ),
                                Text(
                                  "${state.currentIndex + 1}/${state.testResponse.tests.length}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 16.sp),
                                ),
                              ],
                            ),
                            5.getH,
                            CountView(test: state.testStatuses),
                          ],
                        ),
                      ),
                    );
                  }

                  return SafeArea(
                    child: Column(
                      children: [
                        HeaderWidget(
                          onTap: () {},
                          onTapBack: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

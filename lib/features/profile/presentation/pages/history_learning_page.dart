import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/global/widget/header_widget.dart';
import 'package:express_testing/core/global/widget/main_background.dart';
import 'package:express_testing/core/global/widget/png_selection_btn_widget.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:express_testing/features/profile/presentation/bloc/profile_event.dart';
import 'package:express_testing/languages/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../bloc/streaks/streaks_bloc.dart';
import '../bloc/streaks/streaks_state.dart';

class HistoryLearningPage extends StatefulWidget {
  const HistoryLearningPage({super.key});

  @override
  State<HistoryLearningPage> createState() => _HoState();
}

class _HoState extends State<HistoryLearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(child: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(15)),
        child: Column(children: [
          HeaderWidget(
            onTapBack: () {
              Navigator.pop(context);
            },
          ),
          20.getH,
          Text(
            LocaleKeys.stady_history.tr(),
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 22.sp,
            ),
          ),
          14.getH,

          BlocBuilder<StreakBloc, StreakState>(
            builder: (_, state) {
              if (state is StreakLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is StreakLoaded) {
                final streaks = state.streak.streaks;

                return ListView.builder(
                  itemCount: streaks.length,
                  itemBuilder: (context, index) {
                    final streak = streaks[index];
                    return PngSelectionBtnWidget(
                      title: streak.date,
                      opacity: streak.isCompleted ? 1.0 : 0.6,
                      onTap: () => context.read<StreakBloc>().add(StreakEvent()),
                      actionIconPath: AppIcons.checkCircle,
                      circleColor: AppColors.c00D8A5,
                    );
                  },
                );
              } else if (state is StreakError) {
                return Center(child: Text("Error: ${state.message}"));
              }
              return const SizedBox();
            },
          )

        ]),
      ))),
    );
  }
}

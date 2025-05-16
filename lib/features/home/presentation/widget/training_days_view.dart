import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/extension/size_extension.dart';
import '../../../../languages/locale_keys.g.dart';
import 'day_button.dart';

class TrainingDaysView extends StatefulWidget {
  const TrainingDaysView({super.key});

  @override
  State<TrainingDaysView> createState() => _TrainingDaysViewState();
}

class _TrainingDaysViewState extends State<TrainingDaysView> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 25.we, vertical: 17.he),
      margin: EdgeInsets.symmetric(horizontal: 15.we),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.c242424.withValues(alpha: 0.5),
          width: 1.we,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              LocaleKeys.training_days.tr(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20.sp,
                  ),
            ),
          ),
          10.getH(),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 8.we,
            runSpacing: 8.we,
            children: List.generate(10, (index) {
              return DayButton(
                isActive: _selectIndex == index,
                onTab: () {
                  setState(() {
                    _selectIndex = index;
                  });
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

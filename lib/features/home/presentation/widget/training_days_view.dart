import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors/app_colors.dart';
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
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: appW(25), vertical: appH(17)),
      margin: EdgeInsets.symmetric(horizontal: appW(15)),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.c242424.withOpacity(0.5),
          width: 1,
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
          10.getH,
          Wrap(
            alignment: WrapAlignment.start,
            spacing: appW(8),
            runSpacing: appW(8),
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

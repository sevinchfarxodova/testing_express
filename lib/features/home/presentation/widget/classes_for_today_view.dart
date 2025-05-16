import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/extension/size_extension.dart';
import 'package:express_testing/core/local_source/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../languages/locale_keys.g.dart';
import 'classes_for_today_item.dart';

class ClassesForTodayView extends StatefulWidget {
  const ClassesForTodayView({super.key});

  @override
  State<ClassesForTodayView> createState() => _ClassesForTodayViewState();
}

class _ClassesForTodayViewState extends State<ClassesForTodayView> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.we),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.clickHand,
                width: 38.we,
                height: 38.we,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              6.getW(),
              Expanded(
                child: Text(
                  LocaleKeys.classes_for_today.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 22.sp),
                ),
              ),
            ],
          ),
          15.getH(),
          ...List.generate(
            5,
            (index) => ClassesForTodayItem(
              onTab: () {
                setState(() {
                  _currentIndex = index;
                });
                final userId = StorageRepository.getString(key: "user_id");
                print("📦 userId from storage: $userId");

                Navigator.pushNamed(
                  context,
                  AppRoutesNames.lesson,
                  arguments: userId
                );
              },
              isShowBottomLiner: index != 4,
              isActive: index == _currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/test_enum.dart';
import 'count_item.dart';

class CountView extends StatelessWidget {
  const CountView({super.key, required this.test});

  final List<TestStatus> test;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xFF3C3C3C).withValues(alpha: 0.33);
    bool isLight = Theme.of(context).brightness == Brightness.light;

    if (isLight) {
      backgroundColor = Color(0xFFC7C7C7).withValues(alpha: 0.15);
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Wrap(
        children: List.generate(
          test.length,
          (index) {
            return CountItem(
              title: (index + 1).toString(),
              isActive: (index + 1) == 16,
              testStatus: test[index],
              beforeEndTestStatus: index > 0 ? test[index - 1] : null,
              nextTestStatus: index + 1 < test.length ? test[index + 1] : null,
            );
          },
        ),
      ),
    );
  }
}

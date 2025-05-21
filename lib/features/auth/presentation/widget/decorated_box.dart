import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_theme.dart';

class MyDecoratedBox extends StatelessWidget {
  final String title;

  const MyDecoratedBox({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: AppTheme.themedBoxDecoration(context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(23), vertical: 8.h),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}


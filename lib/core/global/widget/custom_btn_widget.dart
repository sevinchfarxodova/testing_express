import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors/app_colors.dart';
import '../../styles/app_text_style.dart';
import '../../utils/responsiveness/app_responsive.dart';

class CustomBtnWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color? titleColor;
  final IconData? icon;
  final bool isActive;
  final bool isLoading;

  const CustomBtnWidget({
    super.key,
    required this.btnText,
    required this.onTap,
    this.backgroundColor = AppColors.btnColor,
    this.icon,
    this.titleColor,
    this.isActive = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (isActive && !isLoading) ? onTap : null,
      child: SizedBox(
        width: AppResponsive.screenWidth,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: isActive ? backgroundColor : AppColors.c5F5F5F,
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
              width: appW(1),
            ),
          ),
          child:
              isLoading
                  ? Padding(
                    padding: EdgeInsets.all(appW(20)),
                    child: Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  )
                  : Padding(
                    padding: EdgeInsets.all(appW(20)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          btnText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.nunitoBold.copyWith(
                            color:
                                titleColor ??
                                AppColors.white.withValues(alpha: 0.9),
                            fontSize: 16.sp,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            icon,
                            size: 24.sp,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }
}

import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class ConfirmInput extends StatelessWidget {
  const ConfirmInput({
    super.key,
    this.pinController,
    this.focusNode,
    required this.onCompleted,
    this.validator,
    this.onChanged,
    this.length = 4,
    this.horizontalPadding = 12,
  });

  final TextEditingController? pinController;
  final FocusNode? focusNode;
  final int length;
  final int horizontalPadding;
  final String? Function(String? pin)? validator;
  final Function(String pin) onCompleted;
  final Function(String pin)? onChanged;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.symmetric(
        horizontal: appW(horizontalPadding.toDouble()),
      ),
      width: appW(75),
      height: appH(99),
      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xff242424), width: appW(1)),
      ),
    );

    return Pinput(
      onChanged: onChanged,
      length: length,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      defaultPinTheme: defaultPinTheme,
      controller: pinController,
      focusNode: focusNode,
      validator: validator,
      onCompleted: onCompleted,
      cursor: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: appH(8)),
          height: appH(3),
          width: appW(13),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary,
            width: appW(1),
          ),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.red, width: appW(1)),
        ),
      ),
    );
  }
}

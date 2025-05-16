import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichTextWidget extends StatelessWidget {
  final String aboutText;
  final String onTapedText;
  final VoidCallback onTap;

  const CustomRichTextWidget({
    super.key,
    required this.aboutText,
    required this.onTapedText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: aboutText,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 12.sp,
        ),
        children: [
          const TextSpan(text: "  "),
          TextSpan(
            text: onTapedText,
            style: TextStyle(
              color: Color(0xFF00D8A5),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

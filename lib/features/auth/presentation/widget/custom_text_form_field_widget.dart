
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/colors/app_colors.dart';


class CustomTextFormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;

  const CustomTextFormFieldWidget({super.key, this.controller});

  @override
  State<CustomTextFormFieldWidget> createState() => _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  late FocusNode _focusNode;
  late TextEditingController _controller;

  final maskFormatter = MaskTextInputFormatter(
    mask: '(##) ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: TextInputType.phone,
      inputFormatters: [maskFormatter],
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      onChanged: (value) {
        setState(() {
          // Bu yerda value bilan bog'liq o'zgarishlarni qilishingiz mumkin
        });
      },
      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18.sp),
      decoration: InputDecoration(
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.getW,
            SvgPicture.asset(
              AppIcons.call,
              width: appW(22),
              height: appH(22),
            ),
            16.getW,
            Text(
              "+998 ",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18.sp),
            ),
          ],
        ),
        hintText: '(__) ___-__-__',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.btnColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}

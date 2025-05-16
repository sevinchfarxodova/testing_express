import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/extension/size_extension.dart';
import '../../../../global/widget/custom_btn_widget.dart';
import '../../../../global/widget/main_background.dart';
import '../../../../languages/locale_keys.g.dart';
import '../bloc/auth_event.dart';
import '../bloc/sendSms/send_sms_bloc.dart';
import '../bloc/sendSms/send_sms_state.dart';
import '../widget/custom_rich_text_widget.dart';
import '../widget/custom_text_form_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    SizedBox(
                      width: 270.r,
                      height: 150.r,
                      child: Image(image: AssetImage(AppImages.electroCarIcon)),
                    ),
                    10.getH(),
                    CustomTextFormFieldWidget(controller: _controller),
                    10.getH(),
                    BlocConsumer<SendSmsBloc, SendSmsState>(
                      listener: (context, state) {
                        if (state is SendSmsSuccess) {
                          final formattedPhone = formatPhoneNumber(_controller.text);
                          Navigator.pushNamed(
                            context,
                            AppRoutesNames.confirm,
                            arguments: formattedPhone,
                          );
                        } else if (state is SendSmsError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Xatolik yuz berdi, qayta urinib ko’ring!",
                              ),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomBtnWidget(
                          isActive: _controller.text.length == 14,
                          isLoading: state is SendSmsLoading,
                          onTap: () {
                            if (_controller.text.length == 14) {
                              final formattedPhone = formatPhoneNumber(
                                _controller.text,
                              );
                              context.read<SendSmsBloc>().add(
                                SendSmsEvent(formattedPhone),
                              );
                            }
                          },
                          btnText: LocaleKeys.send_sms.tr(),
                        );
                      },
                    ),
                  ],
                ),
                CustomRichTextWidget(
                  aboutText: LocaleKeys.rich_text_about.tr(),
                  onTapedText: LocaleKeys.rich_text_on_tap.tr(),
                  onTap: () {
                    print("Rich text tapped");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

String formatPhoneNumber(String raw) {
  final digits = raw.replaceAll(RegExp(r'\D'), '');
  return '+998$digits';
}

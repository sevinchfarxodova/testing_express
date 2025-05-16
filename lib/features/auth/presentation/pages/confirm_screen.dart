import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/extension/size_extension.dart';
import 'package:express_testing/core/routes/app_routes.dart';
import 'package:express_testing/features/auth/presentation/widget/confirm_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../global/widget/custom_btn_widget.dart';
import '../../../../global/widget/main_background.dart';
import '../../../../languages/locale_keys.g.dart';
import '../bloc/auth_event.dart';
import '../bloc/confirm_code/confirm_code_bloc.dart';
import '../bloc/confirm_code/confirm_code_state.dart';
import '../widget/custom_rich_text_widget.dart';

class ConfirmScreen extends StatefulWidget {
  final String phone;

  const ConfirmScreen({super.key, required this.phone});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void _confirm() {
    context.read<ConfirmCodeBloc>().add(
      ConfirmCodeEvent(
        phoneNumber: widget.phone,
        verificationCode: _pinController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.phone.isEmpty) {
      return Scaffold(body: Center(child: Text("Telefon raqami topilmadi.")));
    }

    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            AppImages.keyIcon,
                            width: 125.r,
                            height: 125.r,
                          ),
                          15.getH(),
                          ConfirmInput(
                            onCompleted: (_) => setState(() {}),
                            onChanged: (_) => setState(() {}),
                            pinController: _pinController,
                          ),
                          15.getH(),
                          BlocConsumer<ConfirmCodeBloc, ConfirmCodeState>(
                            listener: (context, state) {
                              if (state is ConfirmCodeSuccess) {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutesNames.testUser,
                                );
                              } else if (state is ConfirmCodeError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Tasdiqlash kodi noto‘g‘ri!"),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              final isLoading = state is ConfirmCodeLoading;
                              return CustomBtnWidget(
                                isActive: _pinController.text.length == 4,
                                isLoading: isLoading,
                                onTap: () => _confirm(),
                                btnText: LocaleKeys.confirm.tr(),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomRichTextWidget(
                aboutText: LocaleKeys.rich_text_about.tr(),
                onTapedText: LocaleKeys.rich_text_on_tap.tr(),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

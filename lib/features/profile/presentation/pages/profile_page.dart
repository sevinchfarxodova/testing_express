import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/global/widget/main_background.dart';
import 'package:express_testing/core/routes/app_routes.dart';
import 'package:express_testing/core/routes/navigation_service.dart';
import 'package:express_testing/core/styles/app_text_style.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:express_testing/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:express_testing/features/profile/presentation/bloc/profile_event.dart';
import 'package:express_testing/features/profile/presentation/bloc/profile/profile_state.dart';
import 'package:express_testing/features/profile/presentation/widget/btns_of_profile_page.dart';
import 'package:express_testing/features/profile/presentation/widget/custom_rich_text.dart';
import 'package:express_testing/features/profile/presentation/widget/profile_image_view.dart';
import 'package:express_testing/languages/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? xFile;

  Future<void> getFile(BuildContext context) async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      context.read<ProfileBloc>().add(UploadFileEvent(file: File(pickedFile.path)));
      setState(() {
        xFile = pickedFile;
      });
      print('Fayl yo‘li: ${pickedFile.path}');
    } else {
      print('Hech qanday rasm tanlanmadi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Column(
            children: [
              15.getH,
              BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state is ProfileUpdateError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          state.message,
                          style: AppTextStyle.nunitoMedium.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }

                  if (state is ProfileLoggedOut) {
                    debugPrint("success_logout -----------");
                    NavigationService.instance.pushNamedAndRemoveUntil(
                      routeName: AppRoutesNames.splash,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ProfileUpdating) {
                    return const Center(
                      child: CupertinoActivityIndicator(color: Colors.grey),
                    );
                  }

                  String imageUrl = '';
                  if (state is ProfileUpdated) {
                    imageUrl = state.updatedProfile.imageUrl ;
                  }

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: appW(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileImageView(
                          xFile: xFile,
                          imageUrl: imageUrl,
                        ),
                        8.getH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "your",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            IconButton(
                              onPressed: () => getFile(context),
                              icon: SvgPicture.asset(
                                AppIcons.pencilEdit,
                                width: 14.w,
                                height: 14.h,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.onPrimary,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                        6.getH,
                        const BtnsOfProfilePage(),
                      ],
                    ),
                  );
                },
              ),
              const Spacer(),
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

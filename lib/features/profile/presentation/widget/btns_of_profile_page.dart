import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:express_testing/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:express_testing/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/global/widget/svg_selection_btn_widget.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/navigation_service.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../languages/locale_keys.g.dart';

class BtnsOfProfilePage extends StatelessWidget {
  const BtnsOfProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgSelectionBtnWidget(
          title: LocaleKeys.app_language.tr(),
          onTap: () => _navigateToScreen(AppRoutesNames.language),
          leadingIconPath: AppIcons.language,
          actionIconPath: AppIcons.chevronRight,
        ),
        _spacer(),
        SvgSelectionBtnWidget(
          title: LocaleKeys.stady_history.tr(),
          onTap: () => _navigateToScreen(AppRoutesNames.history),
          leadingIconPath: AppIcons.history,
          actionIconPath: AppIcons.chevronRight,
        ),
        _spacer(),
        SvgSelectionBtnWidget(
          title: LocaleKeys.app_theme.tr(),
          onTap: () => _navigateToScreen(AppRoutesNames.appTheme),
          leadingIconPath: AppIcons.appTheme,
          actionIconPath: AppIcons.chevronRight,
        ),
        _spacer(),
        SvgSelectionBtnWidget(
          title: LocaleKeys.paid.tr(),
          onTap: () => _toPaymant(),
          leadingIconPath: AppIcons.payment,
          titleColor: AppColors.c2DC937,
        ),
        _spacer(),
        // log out
        SvgSelectionBtnWidget(
          title: LocaleKeys.log_out.tr(),
          onTap: () => context.read<ProfileBloc>().add(LogOutEvent()),
          opacity: 0.7,
        ),
        _spacer(),
        SvgSelectionBtnWidget(
          title: LocaleKeys.delete_account.tr(),
          onTap: () => _showDeleteAlertDialog(context),
          actionIconPath: AppIcons.chevronRightRed,
          titleColor: AppColors.ccc3232,
          opacity: 0.7,
        ),
      ],
    );
  }

  Widget _spacer() => SizedBox(height: 10);

  void _navigateToScreen(String pathScreen) {
    NavigationService.instance.pushNamed(routeName: pathScreen);
  }

  void _toPaymant() {
    // NavigationService.instance.navigateMyScreen(
    //   routeName: AppRoutesNames.testPage,
    // );
  }

  void _showDeleteAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.scrim,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              color: AppColors.c5F5F5F.withValues(alpha: 0.4),
              width: 1.sp,
            ),
          ),
          title: Text(
            LocaleKeys.alert_dialog_title.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 20.sp,
                ),
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Row(
              children: [
                //
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.c054649,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      LocaleKeys.cancel.tr(),
                      style: AppTextStyle.nunitoBold.copyWith(fontSize: 14.sp),
                    ),
                  ),
                ),
                6.getW,
                // delete
                Expanded(
                  child: TextButton(
                    onPressed: () {
                     context.read<ProfileBloc>().add(DeleteEvent());
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                    child: Text(
                      LocaleKeys.delete.tr(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

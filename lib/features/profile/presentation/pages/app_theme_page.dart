import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/constants/app_icons.dart';
import 'package:express_testing/core/global/widget/chosen_tile_widget.dart';
import 'package:express_testing/core/global/widget/header_widget.dart';
import 'package:express_testing/core/global/widget/main_background.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:express_testing/languages/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingTheme extends StatefulWidget {
  const SettingTheme({super.key});

  @override
  State<SettingTheme> createState() => _SettingThemeState();
}

class _SettingThemeState extends State<SettingTheme> {
  bool isLightTheme = true;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLightTheme = prefs.getBool('isLightTheme') ?? true;
    });
  }

  _saveTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLightTheme', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: appW(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  onTapBack: () => Navigator.pop(context),
                ),
                20.getH,
                Text(
                  LocaleKeys.app_theme.tr(),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 22.sp,
                  ),
                ),
                14.getH,
                ChosenTileWidget(
                  title: LocaleKeys.light.tr(),
                  isSelected: isLightTheme,
                  onTap: () {
                    AdaptiveTheme.of(context).setLight();
                    setState(() {
                      isLightTheme = true;
                    });
                    _saveTheme(true);
                  },
                  leadingIconPath: AppIcons.sun,
                  actionIconPath: isLightTheme ? AppIcons.check : null,
                ),
                10.getH,
                ChosenTileWidget(
                  title: LocaleKeys.dark.tr(),
                  isSelected: !isLightTheme,
                  onTap: () {
                    AdaptiveTheme.of(context).setDark();

                    setState(() {
                      isLightTheme = false;
                    });
                    _saveTheme(false);
                  },
                  leadingIconPath: AppIcons.moon,
                  actionIconPath: !isLightTheme ? AppIcons.check : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/core/constants/app_icons.dart';
import 'package:express_testing/core/constants/app_images.dart';
import 'package:express_testing/core/global/widget/chosen_tile_widget.dart';
import 'package:express_testing/core/global/widget/header_widget.dart';
import 'package:express_testing/core/global/widget/main_background.dart';
import 'package:express_testing/core/utils/responsiveness/app_responsive.dart';
import 'package:express_testing/languages/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguagePage extends StatefulWidget {
  const AppLanguagePage({super.key});

  @override
  State<AppLanguagePage> createState() => _AppLanguagePageState();
}

class _AppLanguagePageState extends State<AppLanguagePage> {
  String selectedLanguage = 'Русский';

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = prefs.getString('selectedLanguage') ?? 'Русский';
    });
  }

  _saveLanguage(String language) async {
    setState(() {
      selectedLanguage = language;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedLanguage', language);
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
                    LocaleKeys.change_language.tr(),
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 22.sp,
                    ),
                  ),
                  14.getH,
                  ChosenTileWidget(
                    title: "Русский",
                    isSelected: selectedLanguage == "Русский",
                    leadingIconPath: AppImages.flagRus,
                    opacity: selectedLanguage == "Русский" ? 0.6 : 0.9,
                    actionIconPath:
                    selectedLanguage == "Русский" ? AppIcons.check : null,
                    onTap: () async {
                      await context.setLocale(Locale('ru'));

                      _saveLanguage("Русский");
                    },
                  ),
                  10.getH,
                  ChosenTileWidget(
                    title: "O'zbekcha",
                    isSelected: selectedLanguage == "O'zbekcha",
                    leadingIconPath: AppImages.flagUzb,
                    opacity: selectedLanguage == "O'zbekcha" ? 0.6 : 0.9,
                    actionIconPath:
                    selectedLanguage == "O'zbekcha" ? AppIcons.check : null,
                    onTap: () async {
                      await context.setLocale(Locale('uz'));

                      _saveLanguage("O'zbekcha");
                    },
                  ),
                  10.getH,
                  ChosenTileWidget(
                    title: "English",
                    isSelected: selectedLanguage == "English",
                    leadingIconPath: AppImages.flagEng,
                    opacity: selectedLanguage == "English" ? 0.6 : 0.9,
                    actionIconPath:
                    selectedLanguage == "English" ? AppIcons.check : null,
                    onTap: () async {
                      await context.setLocale(Locale('en'));

                      _saveLanguage("English");
                    },
                  ),
            ]),
          ),
        ),
      ),
    );
  }
}

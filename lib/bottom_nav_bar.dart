import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'core/constants/app_icons.dart';
import 'core/constants/colors/app_colors.dart';
import 'languages/locale_keys.g.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    ProfilePage(),
    ProfilePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final selectedIconColor = isDark ? Colors.white : AppColors.black;
    final unselectedIconColor = Colors.grey;
    final labels = [
      LocaleKeys.home.tr(),
      LocaleKeys.tests.tr(),
      LocaleKeys.profile.tr(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: selectedIconColor,
          unselectedItemColor: unselectedIconColor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: List.generate(3, (index) {
            final isSelected = index == _currentIndex;
            final iconColor = isSelected
                ? (isDark ? Colors.white : AppColors.black)
                : Colors.grey;

            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _getIconPath(index),
                color: iconColor,
              ),
              label: labels[index],
            );
          }),
        ),
      ),
    );
  }

  String _getIconPath(int index) {
    switch (index) {
      case 0:
        return AppIcons.home;
      case 1:
        return AppIcons.tests;
      case 2:
        return AppIcons.user;
      default:
        return AppIcons.home;
    }
  }
}


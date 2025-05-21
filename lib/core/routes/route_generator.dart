import 'package:express_testing/bottom_nav_bar.dart';
import 'package:express_testing/features/auth/presentation/pages/splash_page.dart';
import 'package:express_testing/features/profile/presentation/pages/app_language_page.dart';
import 'package:express_testing/features/profile/presentation/pages/app_theme_page.dart';
import 'package:express_testing/features/profile/presentation/pages/history_learning_page.dart';
import 'package:express_testing/features/profile/presentation/pages/profile_page.dart';
import 'package:express_testing/features/tests_pages/presentation/pages/tests_option_page.dart';
import 'package:express_testing/features/tests_pages/presentation/pages/tests_page.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/main.dart';
import '../../features/auth/presentation/pages/confirm_screen.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/must_pay_screen.dart';
import '../../features/auth/presentation/pages/rate_page.dart';
import '../../features/auth/presentation/pages/test_user_screen.dart';
import '../../features/auth/presentation/pages/theme_screen.dart';
import '../../features/home/presentation/screens/home_page.dart';
import '../../features/lesson/presentation/screens/lessons_page.dart';
import 'app_routes.dart';

class AppRoutes {
  static final AppRoutes _instance = AppRoutes._init();

  static AppRoutes get instance => _instance;

  AppRoutes._init();

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
    //    auth

      case AppRoutesNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case AppRoutesNames.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case AppRoutesNames.confirm:
        final phone = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => ConfirmScreen(phone: phone ?? ""),
        );
      case AppRoutesNames.testUser:
        return MaterialPageRoute(builder: (context) => const TestUserScreen());
      case AppRoutesNames.mustPay:
        return MaterialPageRoute(builder: (context) => const MustPayScreen());
      case AppRoutesNames.ratePage:
        return MaterialPageRoute(builder: (context) => const RatePage());
      case AppRoutesNames.themePage:
        return MaterialPageRoute(builder: (context) => const ThemeScreen());
      case AppRoutesNames.home:
        return MaterialPageRoute(builder: (context) => const BottomNavBar());
      // case AppRoutesNames.lesson:
      //   final userId = settings.arguments as String;
      //   return MaterialPageRoute(
      //     builder: (context) => TaskPage(userId: userId),
      //   );

    // home
    case AppRoutesNames.home:
      return MaterialPageRoute(builder: (context) => const MyHomePage(title: ""));



    //  profile
      case AppRoutesNames.profile:
        return MaterialPageRoute(builder: (context) => const ProfilePage());

      case AppRoutesNames.language:
      return MaterialPageRoute(builder: (context) =>  AppLanguagePage());

    case AppRoutesNames.appTheme:
      return MaterialPageRoute(builder: (context) =>  SettingTheme());

    case AppRoutesNames.history:
      return MaterialPageRoute(builder: (context) =>  HistoryLearningPage());

      // tests
      case AppRoutesNames.testsOptionPage:
        return MaterialPageRoute(builder: (context) =>  TestsOptionPage());
      case AppRoutesNames.testPage:
        return MaterialPageRoute(builder: (context) =>  TestPage());


    // case AppRoutesNames.confirm:
    //   return MaterialPageRoute(
    //     builder: (context) => ConfirmScreen(
    //       authCubit: settings.arguments as AuthCubit,
    //     ),
    //   );

    // case AppRoutesNames.resultPage:
    //   {
    //     Map<String, dynamic> data =
    //     settings.arguments as Map<String, dynamic>;
    //     return MaterialPageRoute(
    //       builder: (context) => ResultPage(
    //         countTrueAnswer: data["count_true_answer"],
    //         lengthTest: data["length_test"],
    //       ),
    //     );
    //   }


      case AppRoutesNames.bottomNavBar:
        return MaterialPageRoute(builder: (context) =>  BottomNavBar());


      default:
        return MaterialPageRoute(builder: (context) => const ProfilePage());
    }
  }
}
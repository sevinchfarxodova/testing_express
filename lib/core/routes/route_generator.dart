import 'package:express_testing/bottom_nav_bar.dart';
import 'package:express_testing/features/profile/presentation/pages/app_language_page.dart';
import 'package:express_testing/features/profile/presentation/pages/app_theme_page.dart';
import 'package:express_testing/features/profile/presentation/pages/history_learning_page.dart';
import 'package:express_testing/features/profile/presentation/pages/profile_page.dart';
import 'package:express_testing/features/tests_pages/presentation/pages/tests_option_page.dart';
import 'package:express_testing/features/tests_pages/presentation/pages/tests_page.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

class AppRoutes {
  static final AppRoutes _instance = AppRoutes._init();

  static AppRoutes get instance => _instance;

  AppRoutes._init();

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
    //    auth
    //   case AppRoutesNames.login://
    //     return MaterialPageRoute(builder: (context) => const LoginScreen());


    // home
    // case AppRoutesNames.home:
    //   return MaterialPageRoute(builder: (context) => const HomeScreen());



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
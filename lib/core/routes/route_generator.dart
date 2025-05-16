import 'package:express_testing/features/auth/presentation/pages/confirm_screen.dart';
import 'package:express_testing/features/auth/presentation/pages/must_pay_screen.dart';
import 'package:express_testing/features/auth/presentation/pages/rate_page.dart';
import 'package:express_testing/features/auth/presentation/pages/test_user_screen.dart';
import 'package:express_testing/features/auth/presentation/pages/theme_screen.dart';
import 'package:express_testing/features/lesson/presentation/screens/lessons_page.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/home/presentation/screens/home_page.dart';
import 'app_routes.dart';

class AppRoutes {
  static final AppRoutes _instance = AppRoutes._init();

  static AppRoutes get instance => _instance;

  AppRoutes._init();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRoutesNames.lesson:
        final userId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => TaskPage(userId: userId),
        );



      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}

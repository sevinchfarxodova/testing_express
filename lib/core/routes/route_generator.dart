// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'app_routes.dart';
//
// class AppRoutes {
//   static final AppRoutes _instance = AppRoutes._init();
//
//   static AppRoutes get instance => _instance;
//
//   AppRoutes._init();
//
//   static Route generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//
//       auth
//     case AppRoutesNames.login:
//       return MaterialPageRoute(builder: (context) => const LoginScreen());
//
//
//
//
//
//     home
//
//
//     lessons
//
//
//
//     test
//
//     profile
//
//
//       case AppRoutesNames.appTheme:
//         return MaterialPageRoute(builder: (context) => const SettingTheme());
//       case AppRoutesNames.history:
//         return MaterialPageRoute(builder: (context) => const HistoryScreen());
//       // case AppRoutesNames.language:
//         return MaterialPageRoute(builder: (context) => const SettingLanguage());
//       case AppRoutesNames.profile:
//         return MaterialPageRoute(builder: (context) => const ProfileScreen());
//       case AppRoutesNames.themePage:
//         return MaterialPageRoute(builder: (context) => const ThemeScreen());
//       case AppRoutesNames.lesson:
//         return MaterialPageRoute(builder: (context) => const LessonPage());
//       case AppRoutesNames.mustPay:
//         return MaterialPageRoute(builder: (context) => const MustPayScreen());
//       case AppRoutesNames.testUser:
//         return MaterialPageRoute(builder: (context) => const TestUserScreen());
//       case AppRoutesNames.confirm:
//         return MaterialPageRoute(
//           builder: (context) => ConfirmScreen(
//             authCubit: settings.arguments as AuthCubit,
//           ),
//         );
//
//       case AppRoutesNames.login:
//         return MaterialPageRoute(builder: (context) => const LoginScreen());
//       case AppRoutesNames.splash:
//         return MaterialPageRoute(builder: (context) => const SplashScreen());
//       case AppRoutesNames.resultPage:
//         {
//           Map<String, dynamic> data =
//           settings.arguments as Map<String, dynamic>;
//           return MaterialPageRoute(
//             builder: (context) => ResultPage(
//               countTrueAnswer: data["count_true_answer"],
//               lengthTest: data["length_test"],
//             ),
//           );
//         }
//       case AppRoutesNames.home:
//         return MaterialPageRoute(builder: (context) => const HomeScreen());
//       case AppRoutesNames.testPage:
//         return MaterialPageRoute(builder: (context) => const TestPage());
//       case AppRoutesNames.ratePage:
//         return MaterialPageRoute(builder: (context) => const RatePage());
//
//
//       default:
//        return MaterialPageRoute(builder: (context) => const HomeScreen());
//     }
//
//
// }
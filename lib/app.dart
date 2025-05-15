import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:express_testing/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:express_testing/features/profile/presentation/bloc/streaks/streaks_bloc.dart';
import 'package:express_testing/features/tests_pages/presentation/bloc/test/test_bloc.dart';
import 'package:express_testing/features/tests_pages/presentation/bloc/test/test_selection/test_selec_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/service_locator.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/navigation_service.dart';
import 'core/routes/route_generator.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/responsiveness/app_responsive.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          ScreenUtil.init(context);
          return AdaptiveTheme(
            light: AppTheme.lightTheme,
            dark: AppTheme.darkTheme,
            initial: AdaptiveThemeMode.system,
            builder: (ThemeData light, ThemeData dark) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<ProfileBloc>(create: (_) => sl<ProfileBloc>()),
                  BlocProvider<StreakBloc>(create: (_) => sl<StreakBloc>()),
                  BlocProvider<TestBloc>(create: (_) => sl<TestBloc>()),
                  BlocProvider<TestSelectionBloc>(create: (_) => sl<TestSelectionBloc>()),
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  locale: context.locale,
                  theme: light,
                  home: child,
                  navigatorKey: NavigationService.instance.navigatorKey,
                  onGenerateRoute: AppRoutes.generateRoute,
                  initialRoute: AppRoutesNames.bottomNavBar,
                ),
              );
            },
          );
        },

    );
  }
}

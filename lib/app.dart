import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/responsiveness/app_responsive.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/navigation_service.dart';
import 'core/routes/route_generator.dart';
import 'core/theme/app_theme.dart';
import 'service_locator.dart';
import 'features/auth/presentation/bloc/confirm_code/confirm_code_bloc.dart';
import 'features/auth/presentation/bloc/sendSms/send_sms_bloc.dart';
import 'features/lesson/presentation/bloc/get_task_bloc/get_task_bloc.dart';
import 'features/lesson/presentation/bloc/home_event.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SendSmsBloc>(create: (_) => sl<SendSmsBloc>()),
        BlocProvider<ConfirmCodeBloc>(create: (_) => sl<ConfirmCodeBloc>()),
        BlocProvider<GetTaskBloc>(
          create: (context) => sl<GetTaskBloc>()..add(GetTaskEvent("0")),
        ),
      ],
      child: MyApp(),
    );
  }
}

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
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              theme: light,
              home: child,
              navigatorKey: NavigationService.instance.navigatorKey,
              onGenerateRoute: AppRoutes.generateRoute,
              initialRoute: AppRoutesNames.splash,
            );
          },
        );
      },
    );
  }
}

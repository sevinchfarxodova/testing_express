import 'package:express_testing/service_locator.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/local_source/storage_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'languages/codegen_loader.g.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await setupLocator();
  StorageRepository.instance;


  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Transparent status bar
    statusBarBrightness: Brightness.dark, // Dark text for status bar
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    EasyLocalization(
      path: 'assets/languages',
      supportedLocales: [
        Locale('en'),
        Locale('ru'),
        Locale('uz'),
      ],
      fallbackLocale: Locale('ru'),
      assetLoader: CodegenLoader(),
      child:  App(),
    ),
  );
}





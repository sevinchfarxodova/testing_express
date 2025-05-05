import 'package:flutter/material.dart';

import 'core/responsiveness/app_responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return MaterialApp(
      title: 'Flutter Demo',
     // home:  MyHomePage(),
    );
  }
}


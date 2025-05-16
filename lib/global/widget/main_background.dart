
import 'package:flutter/material.dart';

import '../../core/extension/size_extension.dart';

class MainBackground extends StatelessWidget {
  const MainBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    LinearGradient linearGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF054649).withValues(alpha: 0.3),
        Color(0xFFFFFFFF),
        Color(0xFFFFFFFF),
        Color(0xFFFFFFFF),
      ],
    );

    bool isDark = Theme.of(context).brightness == Brightness.dark;

    if (isDark) {
      linearGradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF054649).withValues(alpha: 0.3),
          Color(0xFF000000),
          Color(0xFF000000),
          Color(0xFF000000),
        ],
      );
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: linearGradient,
      ),
      child: child,
    );
  }
}

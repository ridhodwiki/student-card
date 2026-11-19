import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const background = Color(0xFF12334B);
  static const card = Color(0xFF19465F);
  static const navigationBar = Color(0xFF0E293D);
  static const navigationAccent = Color(0xFF8AE1D2);
  static const border = Colors.white24;
  static const mutedText = Colors.white70;
}

ThemeData buildAppTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.background,
    brightness: Brightness.dark,
  );
  const activeIcon = IconThemeData(color: AppColors.navigationBar, size: 24);
  const idleIcon = IconThemeData(color: AppColors.mutedText, size: 22);
  const activeLabel = TextStyle(
    color: AppColors.navigationAccent,
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );
  const idleLabel = TextStyle(color: AppColors.mutedText, fontSize: 12);

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.navigationBar,
      elevation: 0,
      indicatorColor: AppColors.navigationAccent,
      iconTheme: WidgetStateProperty.resolveWith(
        (states) =>
            states.contains(WidgetState.selected) ? activeIcon : idleIcon,
      ),
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) =>
            states.contains(WidgetState.selected) ? activeLabel : idleLabel,
      ),
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: AppColors.navigationBar,
      useIndicator: true,
      indicatorColor: AppColors.navigationAccent,
      selectedIconTheme: activeIcon,
      unselectedIconTheme: idleIcon,
      selectedLabelTextStyle: activeLabel,
      unselectedLabelTextStyle: idleLabel,
    ),
  );
}

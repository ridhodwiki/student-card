import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Project - Student Card',
      theme: buildAppTheme(),
      home: const AppRoot(),
    );
  }
}

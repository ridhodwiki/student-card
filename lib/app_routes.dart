import 'package:flutter/material.dart';

import 'navigation.dart';
import 'pages/contact_page.dart';
import 'pages/gallery_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/student_card_page.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return buildAppPage(
      index: AppTab.home,
      onNavigate: (index) => openAppPage(context, index),
    );
  }
}

Widget buildAppPage({
  required int index,
  required ValueChanged<int> onNavigate,
}) {
  return switch (index) {
    AppTab.home => HomePage(onNavigate: onNavigate),
    AppTab.card => StudentCardPage(onNavigate: onNavigate),
    AppTab.profile => ProfilePage(onNavigate: onNavigate),
    AppTab.gallery => GalleryPage(onNavigate: onNavigate),
    AppTab.contact => ContactPage(onNavigate: onNavigate),
    _ => HomePage(onNavigate: onNavigate),
  };
}

void openAppPage(BuildContext context, int index) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (routeContext) => buildAppPage(
        index: index,
        onNavigate: (target) => openAppPage(routeContext, target),
      ),
    ),
  );
}

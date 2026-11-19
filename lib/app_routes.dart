import 'package:flutter/material.dart';

import 'katalog.dart';
import 'navigation.dart';
import 'pages/contact_page.dart';
import 'pages/gallery_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/student_card_page.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  final koleksi = KoleksiProduk();

  @override
  void dispose() {
    koleksi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildAppPage(
      index: AppTab.home,
      koleksi: koleksi,
      onNavigate: (index) => openAppPage(context, index, koleksi),
    );
  }
}

Widget buildAppPage({
  required KoleksiProduk koleksi,
  required int index,
  required ValueChanged<int> onNavigate,
}) {
  return switch (index) {
    AppTab.home => HomePage(onNavigate: onNavigate),
    AppTab.card => StudentCardPage(onNavigate: onNavigate),
    AppTab.profile => ProfilePage(onNavigate: onNavigate),
    AppTab.gallery => GalleryPage(onNavigate: onNavigate),
    AppTab.contact => ContactPage(onNavigate: onNavigate),
    AppTab.katalog => KatalogPage(onNavigate: onNavigate, koleksi: koleksi),
    _ => HomePage(onNavigate: onNavigate),
  };
}

void openAppPage(BuildContext context, int index, KoleksiProduk koleksi) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (routeContext) => buildAppPage(
        index: index,
        koleksi: koleksi,
        onNavigate: (target) => openAppPage(routeContext, target, koleksi),
      ),
    ),
  );
}

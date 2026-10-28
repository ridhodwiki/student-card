import 'package:flutter/material.dart';

import 'navigation.dart';
import 'pages/contact_page.dart';
import 'pages/gallery_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/student_card_page.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = AppTab.home;

  void _select(int index) {
    if (index == _index) {
      return;
    }

    setState(() => _index = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      HomePage(onNavigate: _select),
      StudentCardPage(onNavigate: _select),
      ProfilePage(onNavigate: _select),
      GalleryPage(onNavigate: _select),
      ContactPage(onNavigate: _select),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(appDestinations[_index].title)),
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _select,
        destinations: [
          for (final destination in appDestinations)
            NavigationDestination(
              icon: Icon(destination.icon),
              label: destination.label,
            ),
        ],
      ),
    );
  }
}

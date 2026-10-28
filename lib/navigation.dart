import 'package:flutter/material.dart';

abstract final class AppTab {
  static const home = 0;
  static const card = 1;
  static const profile = 2;
  static const gallery = 3;
  static const contact = 4;
}

class AppDestination {
  const AppDestination({
    required this.label,
    required this.title,
    required this.icon,
  });

  final String label;
  final String title;
  final IconData icon;
}

const appDestinations = <AppDestination>[
  AppDestination(
    label: 'Beranda',
    title: 'Mini Project - Student Card',
    icon: Icons.home_outlined,
  ),
  AppDestination(
    label: 'Kartu',
    title: 'Student Card',
    icon: Icons.badge_outlined,
  ),
  AppDestination(label: 'Profil', title: 'Profil', icon: Icons.person_outline),
  AppDestination(
    label: 'Galeri',
    title: 'Galeri',
    icon: Icons.photo_library_outlined,
  ),
  AppDestination(label: 'Kontak', title: 'Kontak', icon: Icons.call_outlined),
];

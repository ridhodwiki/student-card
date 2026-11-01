import 'package:flutter/material.dart';

import '../app_scaffold.dart';
import '../navigation.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/app_page.dart';
import '../widgets/page_links.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key, required this.onNavigate});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      current: AppTab.gallery,
      onNavigate: onNavigate,
      child: AppPage(
        children: [
          AppCard(
            maxWidth: 360,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset('assets/image/1.png', fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Foto Profil',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Dokumentasi foto mahasiswa untuk mini project ini.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppColors.mutedText),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PageLinks(current: AppTab.gallery, onNavigate: onNavigate),
        ],
      ),
    );
  }
}

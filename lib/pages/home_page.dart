import 'package:flutter/material.dart';

import '../app_scaffold.dart';
import '../navigation.dart';
import '../secondpage.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/app_page.dart';
import '../widgets/page_links.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onNavigate});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      current: AppTab.home,
      onNavigate: onNavigate,
      child: AppPage(
        children: [
          AppCard(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/image/1.png',
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ridho Dwiki Zakaria',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '24670007 • Teknik Informatika',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: AppColors.mutedText),
                ),
                const SizedBox(height: 24),
                Container(height: 1, color: AppColors.border),
                const SizedBox(height: 20),
                const Text(
                  'Mini project Flutter berisi kartu mahasiswa, profil, galeri, '
                  'dan kontak. Gunakan menu di bawah atau tautan halaman untuk '
                  'berpindah.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
            child: const Text('Click Me'),
          ),
          const SizedBox(height: 16),
          PageLinks(current: AppTab.home, onNavigate: onNavigate),
        ],
      ),
    );
  }
}

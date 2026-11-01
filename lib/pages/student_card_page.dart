import 'package:flutter/material.dart';

import '../app_scaffold.dart';
import '../navigation.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/app_page.dart';
import '../widgets/page_links.dart';

class StudentCardPage extends StatelessWidget {
  const StudentCardPage({super.key, required this.onNavigate});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      current: AppTab.card,
      onNavigate: onNavigate,
      child: AppPage(
        children: [
          AppCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'STUDENT CARD',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Image.asset(
                  'assets/image/1.png',
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 40,
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const SizedBox(height: 24),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail, color: Colors.white, size: 24),
                    SizedBox(width: 20),
                    Icon(Icons.phone, color: Colors.white, size: 24),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PageLinks(current: AppTab.card, onNavigate: onNavigate),
        ],
      ),
    );
  }
}

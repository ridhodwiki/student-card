import 'package:flutter/material.dart';

import '../app_scaffold.dart';
import '../navigation.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/app_page.dart';
import '../widgets/page_links.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.onNavigate});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      current: AppTab.profile,
      onNavigate: onNavigate,
      child: AppPage(
        children: [
          AppCard(
            child: SizedBox(
              width: double.infinity,
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
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Mahasiswa Teknik Informatika',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: AppColors.mutedText),
                  ),
                  const SizedBox(height: 24),
                  Container(height: 1, color: AppColors.border),
                  const SizedBox(height: 20),
                  const _ProfileRow(
                    label: 'Nama',
                    value: 'Ridho Dwiki Zakaria',
                  ),
                  const SizedBox(height: 16),
                  const _ProfileRow(label: 'NIM', value: '24670007'),
                  const SizedBox(height: 16),
                  const _ProfileRow(
                    label: 'Program Studi',
                    value: 'Teknik Informatika',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          PageLinks(current: AppTab.profile, onNavigate: onNavigate),
        ],
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  const _ProfileRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(fontSize: 13, color: AppColors.mutedText),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

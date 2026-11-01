import 'package:flutter/material.dart';

import '../app_scaffold.dart';
import '../navigation.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/app_page.dart';
import '../widgets/page_links.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key, required this.onNavigate});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      current: AppTab.contact,
      onNavigate: onNavigate,
      child: AppPage(
        children: [
          AppCard(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _ContactRow(
                    icon: Icons.mail_outline,
                    label: 'EMAIL',
                    value: 'ridhodwiki768@gmail.com',
                  ),
                  const SizedBox(height: 24),
                  Container(height: 1, color: AppColors.border),
                  const SizedBox(height: 24),
                  const _ContactRow(
                    icon: Icons.phone_outlined,
                    label: 'TELEPON',
                    value: '089526352118',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          PageLinks(current: AppTab.contact, onNavigate: onNavigate),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(height: 4),
              SelectableText(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

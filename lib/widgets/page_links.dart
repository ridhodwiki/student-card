import 'package:flutter/material.dart';

import '../navigation.dart';
import '../theme.dart';

class PageLinks extends StatelessWidget {
  const PageLinks({super.key, required this.current, required this.onNavigate});

  final int current;
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 4,
      children: [
        for (var index = 0; index < appDestinations.length; index++)
          if (index != current)
            TextButton(
              onPressed: () => onNavigate(index),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                minimumSize: const Size(0, 44),
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              child: Text(
                appDestinations[index].label,
                style: const TextStyle(color: AppColors.mutedText),
              ),
            ),
      ],
    );
  }
}

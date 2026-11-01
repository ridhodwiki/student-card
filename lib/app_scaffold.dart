import 'package:flutter/material.dart';

import 'navigation.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.current,
    required this.onNavigate,
    required this.child,
  });

  final int current;
  final ValueChanged<int> onNavigate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appDestinations[current].title),
        leading: Navigator.canPop(context)
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Kembali',
              )
            : null,
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: current,
        onDestinationSelected: (index) {
          if (index != current) {
            onNavigate(index);
          }
        },
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

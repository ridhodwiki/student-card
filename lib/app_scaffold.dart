import 'package:flutter/material.dart';

import 'navigation.dart';
import 'theme.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.current,
    required this.onNavigate,
    required this.child,
    this.actions,
  });

  final int current;
  final ValueChanged<int> onNavigate;
  final Widget child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final useRail = size.width >= 1024 && size.height >= 600;
    void select(int index) {
      if (index != current) onNavigate(index);
    }

    return Scaffold(
      appBar: AppBar(
        actions: actions,
        title: Text(appDestinations[current].title),
        leading: Navigator.canPop(context)
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Kembali',
              )
            : null,
      ),
      body: useRail
          ? Row(
              children: [
                NavigationRail(
                  selectedIndex: current,
                  onDestinationSelected: select,
                  labelType: NavigationRailLabelType.all,
                  scrollable: true,
                  destinations: [
                    for (final destination in appDestinations)
                      NavigationRailDestination(
                        icon: Icon(destination.icon),
                        label: Text(destination.label),
                      ),
                  ],
                ),
                const VerticalDivider(width: 1),
                Expanded(child: child),
              ],
            )
          : child,
      bottomNavigationBar: useRail
          ? null
          : Material(
              color: AppColors.navigationBar,
              elevation: 6,
              clipBehavior: Clip.antiAlias,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: NavigationBar(
                labelBehavior: size.width < 400
                    ? NavigationDestinationLabelBehavior.onlyShowSelected
                    : NavigationDestinationLabelBehavior.alwaysShow,
                selectedIndex: current,
                onDestinationSelected: select,
                destinations: [
                  for (final destination in appDestinations)
                    NavigationDestination(
                      icon: Icon(destination.icon),
                      label: destination.label,
                    ),
                ],
              ),
            ),
    );
  }
}

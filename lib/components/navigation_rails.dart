import 'package:flutter/material.dart';
import 'package:material_3_admin/data.dart';

import 'component_decoration.dart';

class NavigationRails extends StatelessWidget {
  const NavigationRails({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentDecoration(
      label: 'Navigation rail',
      tooltipMessage: 'Use NavigationRail',
      child: IntrinsicWidth(
          child: SizedBox(height: 420, child: NavigationRailSection())),
    );
  }
}

class NavigationRailSection extends StatefulWidget {
  const NavigationRailSection({super.key});

  @override
  State<NavigationRailSection> createState() => _NavigationRailSectionState();
}

class _NavigationRailSectionState extends State<NavigationRailSection> {
  int navRailIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      onDestinationSelected: (selectedIndex) {
        setState(() {
          navRailIndex = selectedIndex;
        });
      },
      elevation: 4,
      leading: FloatingActionButton(
          child: const Icon(Icons.create), onPressed: () {}),
      groupAlignment: 0.0,
      selectedIndex: navRailIndex,
      labelType: NavigationRailLabelType.selected,
      destinations: <NavigationRailDestination>[
        ...destinations.map((destination) {
          return NavigationRailDestination(
            label: Text(destination.label),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          );
        }),
      ],
    );
  }
}

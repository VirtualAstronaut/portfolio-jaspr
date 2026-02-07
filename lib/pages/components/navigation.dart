// Add Windows 98 navigation link
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      destinations: <NavigationRailDestination>[
        // Existing navigation destinations...
        NavigationRailDestination(
          icon: Icon(Icons.laptop),
          label: Text('Windows 98'),
        ),
      ],
      selectedIndex: 0,
      onDestinationSelected: (int index) {
        // Existing navigation actions...
      },
    );
  }
}
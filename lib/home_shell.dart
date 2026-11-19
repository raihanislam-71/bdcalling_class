import 'package:famous_gadget/breakpoints.dart';
import 'package:famous_gadget/home_screen.dart';
import 'package:famous_gadget/responsive_layout.dart';
import 'package:flutter/material.dart';

class HomeShell extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  static const _items = [
    (Icons.explore_outlined, Icons.explore, 'Explore'),
    (Icons.favorite_outline, Icons.favorite, 'Saved'),
    (Icons.luggage_outlined, Icons.luggage, 'Trips'),
    (Icons.person_outline, Icons.person, 'Profile'),
  ];

  void _select(int i) => setState(() {
    _index = i;
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        body: const HomeScreen(),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: _select,
          destinations: [
            for (final (icon, selected, label) in _items)
              NavigationDestination(
                icon: Icon(icon),
                label: label,
                selectedIcon: Icon(selected),
              ),
          ],
        ),
      ),
      // desktop: const HomeScreen(),
      tablet: _withRail(extended: false),
      desktop: _withDesktop(extended: false),
    );
  }

  Widget _withDesktop({required bool extended}) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: AppBar(
              title: const Text('Responsive'),
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shop_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const HomeScreen(),
    );
  }

  Widget _withRail({required bool extended}) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: extended,
            selectedIndex: _index,
            onDestinationSelected: _select,
            labelType: extended ? null : NavigationRailLabelType.all,
            leading: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Icon(Icons.travel_explore, size: 32),
            ),
            destinations: [
              for (final (icon, selected, label) in _items)
                NavigationRailDestination(
                  icon: Icon(icon),
                  label: const Text('lable'),
                ),
            ],
          ),
          const VerticalDivider(width: 1),
          const Expanded(child: HomeScreen()),
        ],
      ),
    );
  }
}

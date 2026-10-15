import 'package:bdcalling_class/presentation/state_holders/bottom_nav_controller.dart';
import 'package:bdcalling_class/presentation/ui/screens/cart_screen.dart';
import 'package:bdcalling_class/presentation/ui/screens/home_screen.dart';
import 'package:bdcalling_class/presentation/ui/screens/profile_screen.dart';
import 'package:bdcalling_class/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final BottomNavController _bottomNavController =
      Get.find<BottomNavController>();

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (_) {
        return Scaffold(
          body: _screens[_bottomNavController.selectedIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: NavigationBar(
                backgroundColor: Colors.black,
                indicatorColor: AppColors.themeColor,
                selectedIndex: _bottomNavController.selectedIndex,
                onDestinationSelected: _bottomNavController.changeIndex,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home,size: 35,color: Colors.white),
                    selectedIcon: Icon(Icons.home, color: Colors.white),
                    label: '',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.category,size: 35,color: Colors.white),
                    selectedIcon: Icon(Icons.category, color: Colors.white),
                    label: "",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.shopping_cart,size: 35,color: Colors.white),
                    selectedIcon: Icon(Icons.shopping_cart, color: Colors.white),
                    label: '',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person,size: 35,color: Colors.white),
                    selectedIcon: Icon(Icons.person, color: Colors.white),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

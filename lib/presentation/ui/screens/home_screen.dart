import 'package:bdcalling_class/presentation/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/home/home_banner_slider.dart';
import '../widgets/home/horizontal_category_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Logo or App Name"),
        actions: const [Icon(Icons.notifications_active)],
        backgroundColor: AppColors.themeColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const HomeBannerSlider(),
              const SizedBox(height: 16),
              _buildCategoriesSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        SectionHeader(title: "Category", onTap: () {}),
        const SizedBox(height: 8),
        const SizedBox(height: 110, child: HorizontalCategoriesListView()),
      ],
    );
  }
}




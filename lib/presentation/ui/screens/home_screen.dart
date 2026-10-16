import 'package:bdcalling_class/presentation/ui/widgets/recommended_for_you_grid_card.dart';
import 'package:bdcalling_class/presentation/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';

import '../utils/assets_path.dart';
import '../widgets/hot_deal_grid_card.dart';
import '../widgets/home/home_banner_slider.dart';
import '../widgets/home/horizontal_category_list_view.dart';
import '../widgets/home/horizontal_product_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: const Color(0xFFF3F5FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const HomeBannerSlider(),
              const SizedBox(height: 16),
              SectionHeader(title: "Category", onTap: () {}),
              const SizedBox(height: 16),
              _buildCategoriesSection(),
              const SizedBox(height: 16),
              SectionHeader(title: "Featured Product", onTap: () {}),
              const SizedBox(height: 16),
              _buildFeaturedProductSection(),
              const SizedBox(height: 16),
              SectionHeader(title: "Best Sellers", onTap: () {}),
              const SizedBox(height: 16),
              _buildFeaturedProductSection(),
              const SizedBox(height: 16),
              SectionHeader(title: "Hot Deals", onTap: () {}),
              const SizedBox(height: 16),
              _buildHotDealsGridViewSection(),
              const SizedBox(height: 16),
              _buildFreeShippingCardSection(),
              const SizedBox(height: 16),
              _buildNewArrivalsCardSection(),
              const SizedBox(height: 16),
              SectionHeader(title: "Recommended For You", onTap: () {}),
              const SizedBox(height: 16),
              _buildRecommendedForYouSection(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewArrivalsCardSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF0B1220), Color(0xFF1D2C40)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Arrivals ",
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.white),
                      ),
                      const Text(
                        "Explore the latest tech trends & tools",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Explore"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFreeShippingCardSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFFF6A00), Color(0xFFFFA100)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Free Shipping",
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.white),
                      ),
                      const Text(
                        "On all gadget orders over \$50",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Claim Now"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedForYouSection() {
    return SizedBox(
      width: 430,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return const RecommendedForYouGridCard();
        },
      ),
    );
  }

  Widget _buildHotDealsGridViewSection() {
    return SizedBox(
      width: 430,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return const HotDealGridCard();
        },
      ),
    );
  }

  Widget _buildFeaturedProductSection() {
    return const SizedBox(height: 200, child: HorizontalProductListView());
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset(
            AssetsPath.appLogo,
          ),
          Image.asset(
            AssetsPath.appName,
            color: Colors.black,
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 32)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications, size: 32),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    return SizedBox(height: 110, child: HorizontalCategoriesListView());
  }
}

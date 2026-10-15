import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.computer,
            color: Colors.black,
            size: 48,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Electronics",
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

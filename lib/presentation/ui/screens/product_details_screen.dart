import 'package:bdcalling_class/presentation/state_holders/review_controller.dart';
import 'package:bdcalling_class/presentation/ui/utils/app_colors.dart';
import 'package:bdcalling_class/presentation/ui/widgets/product_details/color_picker.dart';
import 'package:bdcalling_class/presentation/ui/widgets/product_details/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../state_holders/product_cart_button_controller.dart';
import '../widgets/product_details/rating_and_reviews_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageSlider(productId: widget.productId),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildBadge('SAVE 27%', AppColors.themeColor),
                      const SizedBox(width: 8),
                      _buildBadge('IN STOCK', Colors.green),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Sony WH-1000XM5 Wireless Headphones",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const RatingAndReviewsSection(),
                  const SizedBox(height: 16),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "৳ 32,500",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.themeColor,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "৳ 45,000",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ColorPicker(
                    colors: const [
                      Colors.orange,
                      Colors.red,
                      Colors.black,
                      Colors.grey,
                      Colors.blue,
                    ],
                    onColorSelected: (color) {},
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Full Key Specifications",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildSpecificationItem("Battery Life", "Up to 30 Hours"),
                      _buildSpecificationItem(
                        "Noise Cancelling",
                        "Industry Leading ANC",
                      ),
                      _buildSpecificationItem("Driver Size", "30mm"),
                      _buildSpecificationItem("Connectivity", "Bluetooth 5.2"),
                      _buildSpecificationItem("Weight", "250g"),
                      _buildSpecificationItem(
                        "Codec Support",
                        "LDAC / AAC / SBC",
                      ),
                      _buildSpecificationItem(
                        "Microphone",
                        "Beamforming (4 mics)",
                      ),
                      _buildSpecificationItem("Water Resistance", "None"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '''The Sony WH-1000XM5 delivers exceptional sound quality with clear highs, rich bass, and a balanced signature that stays natural across every genre. Whether you're commuting, working, or relaxing, the industry-leading noise cancellation helps you focus on the music while keeping background distractions at bay. Comfort is designed for long listening sessions. The headphones feel lightweight, and the soft ear cushions are shaped to fit comfortably around your ears without putting pressure on the sides of your head. With up to 30 hours of battery life and quick charging, you can enjoy uninterrupted listening all day.''',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RatingAndReviewsSection(),
                        ],
                      ),
                      const SizedBox(height: 6),

                      _buildReviewList(),

                      const SizedBox(height: 16),

                      GetBuilder<ReviewController>(
                        builder: (reviewController) {
                          return SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                reviewController.toggleExpand();
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.orange),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: Text(
                                reviewController.isExpanded ? "Show Less" : "See All 142 Reviews",
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAddToCartSection(context),
    );
  }

  Widget _buildBottomAddToCartSection(BuildContext context) {
    return GetBuilder<ProductCartButtonController>(
      builder: (productCartButtonController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => productCartButtonController.updateQuantity(-1),
                      icon: const Icon(Icons.remove, size: 20),
                    ),
                    Text(
                      "${productCartButtonController.quantity}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () => productCartButtonController.updateQuantity(1),
                      icon: const Icon(Icons.add, size: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    productCartButtonController.addToCart();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Add to Cart - ৳ ${productCartButtonController.totalPrice.toStringAsFixed(0)}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }



  Widget _buildReviewList() {
    return GetBuilder<ReviewController>(
      builder: (reviewController) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reviewController.isExpanded ? 10 : 3,
          itemBuilder: (context, index) {
            return _buildUserReviewsCard();
          },
        );
      }
    );
  }

  Widget _buildUserReviewsCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Aisha Rahman",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(width: 8),
                RatingBarIndicator(
                  rating: 5,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 16.0,
                  direction: Axis.horizontal,
                ),
                const Spacer(),
                const Text(
                  "12 Mar 2026",
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "These are hands-down the best over-ears I've owned. The sound is incredibly detailed, noise cancellation is almost silent.",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecificationItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

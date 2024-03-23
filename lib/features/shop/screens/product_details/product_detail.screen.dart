import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:s_store/common/widgets/texts/section_title.dart';
import 'package:s_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:s_store/features/shop/screens/product_details/widgets/product_attributes.dart';

import 'package:s_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:s_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:s_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:s_store/features/shop/screens/product_reviews/product_reviews.screen.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // --- Product Image Slider
              const CustomProductImageSlider(),

              // --- Product Details
              Padding(
                padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Rating & Share Button
                    const RatingAndShared(),

                    // --- Price, Title, Stock & Brand
                    const ProductMetadata(),

                    // --- Attributes
                    const ProductAttributes(),

                    const SizedBox(height: TSizes.spaceBtwSections),

                    // --- Checkout Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Checkout"),
                      ),
                    ),

                    // --- Description
                    const SizedBox(height: TSizes.spaceBtwSections),

                    const SectionHeading(title: "Description"),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const ReadMoreText(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "Show More",
                      trimExpandedText: "Show Less",
                      moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: TColors.primary,
                      ),
                      lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: TColors.primary,
                      ),
                    ),

                    // --- Reviews
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SectionHeading(title: "Reeviews (199)"),
                        IconButton(
                          onPressed: () => Get.to(
                            () => const ProductReviewsScreen(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 700),
                          ),
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

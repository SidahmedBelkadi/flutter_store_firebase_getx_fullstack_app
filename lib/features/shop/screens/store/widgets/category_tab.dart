import 'package:flutter/material.dart';
import 'package:s_store/common/widgets/brands/brand_show_case.dart';
import 'package:s_store/common/widgets/layouts/grid_layout.dart';
import 'package:s_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:s_store/common/widgets/texts/section_title.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // --- Brands
              const BrandShowCase(
                images: [
                  TImages.productImage3,
                  TImages.productImage2,
                  TImages.productImage1
                ],
              ),

              // --- Products
              const SizedBox(height: TSizes.spaceBtwItems),
              SectionHeading(
                  title: "You might like",
                  showActionButton: true,
                  onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),

              CustomGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const ProductCardVertical(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems)
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:s_store/common/widgets/appbar/appbar.dart';
import 'package:s_store/common/widgets/images/rounded_image.dart';
import 'package:s_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:s_store/common/widgets/texts/section_title.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Sports Shirts"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const RoundedImage(
                width: double.infinity,
                imageUrl: TImages.promoBanner3,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // --- Sub Categories
              Column(
                children: [
                  // Heading
                  const SectionHeading(title: "Sports Shirts"),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 130,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) => const ProductCardHorizontal(),
                      separatorBuilder: (__, _) =>
                          const SizedBox(width: TSizes.spaceBtwItems),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

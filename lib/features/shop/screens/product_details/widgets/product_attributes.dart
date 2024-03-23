import 'package:flutter/material.dart';
import 'package:s_store/common/widgets/chips/choice_chip.dart';
import 'package:s_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:s_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:s_store/common/widgets/texts/product_title_text.dart';
import 'package:s_store/common/widgets/texts/section_title.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        // --- Selected Attributes Pricing & Description
        CircularContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: darkMode ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              // Title, price & stock status
              Row(
                children: [
                  const SectionHeading(title: "Variation"),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(title: "Price :"),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          // --- Actual Price
                          Text(
                            "\$ 25",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          // Sale Price
                          const ProductPriceText(price: "20"),
                        ],
                      ),

                      // --- Stock
                      Row(
                        children: [
                          const ProductTitleText(title: "Stock :"),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),

              // --- Variation & Description
              const ProductTitleText(
                title:
                    "This is the description of the product and it can go up to 4 lines",
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

// ---- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: "Colors"),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: "Green",
                  selected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: "Blue",
                  selected: true,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: "Sizes"),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: "EU 34",
                  selected: true,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: "EU 36",
                  selected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: "EU 38",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

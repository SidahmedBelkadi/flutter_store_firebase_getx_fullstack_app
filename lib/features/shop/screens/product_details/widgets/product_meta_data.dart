import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:s_store/common/widgets/images/circular_image.dart';
import 'package:s_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:s_store/common/widgets/texts/product_title_text.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class ProductMetadata extends StatelessWidget {
  const ProductMetadata({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Price & Sale price
        Row(
          children: [
            // --- Sale tag

            CircularContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(.8),
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.xs,
              ),
              child: Text(
                "25 %",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            // --- Price
            Text(
              "\$ 250",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            const ProductPriceText(
              price: "175",
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //--- Title
        const ProductTitleText(title: "Greeen Nike Sport Shirt"),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // --- Stock Status
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProductTitleText(title: "Status"),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              "In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // --- Brand
        Row(
          children: [
            const CircularImage(
              image: TImages.nikeLogo,
              width: 32,
              height: 32,
            ),
            Row(
              children: [
                Text(
                  "Nike",
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: TSizes.xs),
                const Icon(
                  Iconsax.verify5,
                  color: TColors.primary,
                  size: TSizes.iconXs,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

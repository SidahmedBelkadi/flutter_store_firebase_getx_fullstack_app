import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:s_store/common/widgets/icons/circular_icon.dart';
import 'package:s_store/common/widgets/images/rounded_image.dart';
import 'package:s_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:s_store/common/widgets/texts/product_title_text.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: darkMode ? TColors.darkGrey : TColors.white,
      ),
      child: Row(
        children: [
          // Thumbnail
          CircularContainer(
            height: 130,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: darkMode ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                // --- Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                // Sale tag
                Positioned(
                  top: 10,
                  left: 5,
                  child: Center(
                    child: CircularContainer(
                      height: 30,
                      width: 40,
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.only(top: TSizes.sm),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                // wishlist icon button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          // Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 120, // Set a fixed height here
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ProductTitleText(
                              title: "Green Nike Half slaves shirt",
                              smallSize: true,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems / 2,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Nike",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
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
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(
                                    child: ProductPriceText(price: "256")),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: TColors.dark,
                                    borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(TSizes.cardRadiusMd),
                                      bottomRight: Radius.circular(
                                          TSizes.productImageRadius),
                                    ),
                                  ),
                                  child: const Icon(
                                    Iconsax.add,
                                    color: TColors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

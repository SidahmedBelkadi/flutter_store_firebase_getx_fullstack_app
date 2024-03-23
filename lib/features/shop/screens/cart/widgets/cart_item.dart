import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/widgets/images/rounded_image.dart';
import 'package:s_store/common/widgets/texts/product_title_text.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // --- Image
        RoundedImage(
          imageUrl: TImages.productImage10,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          fit: BoxFit.fill,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        // --- Title, price & Size

        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const ProductTitleText(
              title: "Black Sports Shoes",
              maxLines: 2,
            ),

            // --- Attributes
            Flexible(
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "Color ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: "green  ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: "Size ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: "UK 08 ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
              ),
            ),
          ],
        )
      ],
    );
  }
}

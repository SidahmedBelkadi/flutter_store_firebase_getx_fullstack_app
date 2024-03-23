import 'package:flutter/material.dart';
import 'package:s_store/common/widgets/brands/brand_card.dart';
import 'package:s_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      showBorder: true,
      backgroundColor: Colors.transparent,
      radius: TSizes.cardRadiusLg,
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          const BrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems),
          Row(
              children: images
                  .map((image) => brandTopOroductImageWidget(image, context))
                  .toList()),
        ],
      ),
    );
  }
}

Expanded brandTopOroductImageWidget(String image, BuildContext context) {
  return Expanded(
    child: CircularContainer(
      showBorder: true,
      height: 100,
      backgroundColor: THelperFunctions.isDarkMode(context)
          ? TColors.darkGrey
          : TColors.white,
      margin: const EdgeInsets.only(right: TSizes.md),
      padding: const EdgeInsets.all(TSizes.md),
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.contain,
      ),
    ),
  );
}

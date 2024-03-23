import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/widgets/appbar/appbar.dart';
import 'package:s_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:s_store/common/widgets/icons/circular_icon.dart';
import 'package:s_store/common/widgets/images/rounded_image.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CustomProductImageSlider extends StatelessWidget {
  const CustomProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return SizedBox(
      width: double.infinity,
      child: PrimaryHeaderContainer(
        color: darkMode ? TColors.darkGrey : TColors.light,
        isDecorated: false,
        child: Stack(
          children: [
            //  --- Main Large image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace * 2),
                child: Image(
                  image: AssetImage(TImages.productImage10),
                ),
              ),
            ),

            // ---- Image Slider
            Positioned(
              right: 0,
              left: TSizes.defaultSpace,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => RoundedImage(
                    height: 80,
                    imageUrl: TImages.productImage1,
                    backgroundColor: darkMode ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.grey),
                    padding: const EdgeInsets.all(TSizes.sm),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemCount: 6,
                ),
              ),
            ),

            // --- AppBar
            const Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: CustomAppBar(
                showBackArrow: true,
                actions: [
                  CircularIcon(icon: Iconsax.heart5, color: Colors.red)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

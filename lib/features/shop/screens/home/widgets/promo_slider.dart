import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:s_store/common/widgets/images/rounded_image.dart';
import 'package:s_store/features/shop/controllers/home.controller.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;

    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map((imageUrl) => RoundedImage(imageUrl: imageUrl))
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              banners.length,
              (index) => CircularContainer(
                height: 4,
                width: controller.carouselCurrentIndex.value == index ? 30 : 20,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                backgroundColor: controller.carouselCurrentIndex.value == index
                    ? TColors.primary
                    : TColors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }
}

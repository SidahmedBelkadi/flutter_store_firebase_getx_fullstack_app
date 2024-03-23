import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:s_store/common/widgets/custom_shapes/container/search_container.dart';
import 'package:s_store/common/widgets/layouts/grid_layout.dart';
import 'package:s_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:s_store/common/widgets/texts/section_title.dart';
import 'package:s_store/features/personalization/controllers/user.controller.dart';
import 'package:s_store/features/shop/controllers/category.controller.dart';
import 'package:s_store/features/shop/controllers/home.controller.dart';
import 'package:s_store/features/shop/screens/all_products/all_products.screen.dart';
import 'package:s_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:s_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:s_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(UserController());
    Get.put(CategoryController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///  Header

              PrimaryHeaderContainer(
                height: Get.height * 0.33,
                child: const Column(
                  children: [
                    // ==== AppBar ==== //
                    HomeAppBar(),
                    SizedBox(height: TSizes.spaceBtwSections / 2),

                    // ==== SearchBar ==== //
                    SearchContainer(text: 'Search in store'),
                    SizedBox(height: TSizes.spaceBtwSections / 2),

                    // ==== Categories ==== //

                    Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace),
                      child: Column(
                        children: [
                          SectionHeading(
                            title: 'Popular Categories',
                            textColor: TColors.white,
                          ),
                          SizedBox(height: TSizes.spaceBtwItems),
                          HomeCategories()
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const PromoSlider(
                      banners: [
                        TImages.promoBanner1,
                        TImages.promoBanner2,
                        TImages.promoBanner3,
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    SectionHeading(
                      title: 'Popular Products',
                      showActionButton: true,
                      onPressed: () => Get.to(
                        () => const AllProductsScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(seconds: 1),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Popular ptoducts
                    CustomGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const ProductCardVertical(),
                    ),
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

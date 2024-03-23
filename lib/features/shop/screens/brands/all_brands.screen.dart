import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/appbar/appbar.dart';
import 'package:s_store/common/widgets/brands/brand_card.dart';
import 'package:s_store/common/widgets/layouts/grid_layout.dart';
import 'package:s_store/common/widgets/texts/section_title.dart';
import 'package:s_store/features/shop/screens/brands/brand_products.dart';
import 'package:s_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: Text("Brands"),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const SectionHeading(title: "Brands"),
                const SizedBox(height: TSizes.spaceBtwItems),
                CustomGridLayout(
                  mainAxisExtent: 80,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return BrandCard(
                      showBorder: true,
                      onTap: () => Get.to(
                        () => const BrandProducts(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

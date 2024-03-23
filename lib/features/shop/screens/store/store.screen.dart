import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/appbar/appbar.dart';
import 'package:s_store/common/widgets/brands/brand_card.dart';
import 'package:s_store/common/widgets/custom_shapes/container/search_container.dart';
import 'package:s_store/common/widgets/layouts/grid_layout.dart';
import 'package:s_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:s_store/common/widgets/texts/section_title.dart';
import 'package:s_store/features/shop/screens/brands/all_brands.screen.dart';
import 'package:s_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CartCounterIcon(
              onPressed: () {},
              iconColor: darkMode ? Colors.white : Colors.black,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 400,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // --- Search Bar

                      const SizedBox(height: TSizes.spaceBtwItems),
                      const SearchContainer(
                        text: 'Search in store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      // --- Features Brands
                      SectionHeading(
                        title: 'Features Brands',
                        showActionButton: true,
                        onPressed: () => Get.to(
                          () => const AllBrandsScreen(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(seconds: 1),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),

                      CustomGridLayout(
                        mainAxisExtent: 60,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return const BrandCard();
                        },
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Material(
                    color: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    child: TabBar(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        indicatorColor: TColors.primary,
                        unselectedLabelColor: TColors.darkGrey,
                        labelColor: THelperFunctions.isDarkMode(context)
                            ? TColors.white
                            : TColors.primary,
                        tabs: const [
                          Tab(child: Text("Sports")),
                          Tab(child: Text("Furniture")),
                          Tab(child: Text("Electronics")),
                          Tab(child: Text("Clothes")),
                          Tab(child: Text("Cosmetics")),
                        ]),
                  ),
                ),
              )
            ];
          },
          body: const TabBarView(children: [
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
          ]),
        ),
      ),
    );
  }
}

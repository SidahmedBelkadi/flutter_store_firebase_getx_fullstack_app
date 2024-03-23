import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:s_store/features/shop/controllers/category.controller.dart';
import 'package:s_store/features/shop/models/category.model.dart';
import 'package:s_store/features/shop/screens/home/shimmers/category_shimmer.dart';
import 'package:s_store/features/shop/screens/sub_category/sub_categories.dart';

class HomeCategories extends GetView<CategoryController> {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return CategoryShimmer(
            itemCount: controller.featuredCategories.length,
          );
        }

        if (controller.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              "No Data Found.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white),
            ),
          );
        }

        return SizedBox(
          height: 80,
          child: ListView.builder(
            itemCount: controller.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final CategoryModel category =
                  controller.featuredCategories[index];
              return VerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(
                  () => const SubCategoriesScreen(),
                  transition: Transition.rightToLeft,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

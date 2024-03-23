import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/shimmer/shimmer.dart';
import 'package:s_store/common/widgets/appbar/appbar.dart';
import 'package:s_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:s_store/features/personalization/controllers/user.controller.dart';
import 'package:s_store/features/shop/screens/cart/cart.screen.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/text_strings.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class HomeAppBar extends GetView<UserController> {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            () => controller.profileLoading.value
                ? const AppShimmerEffect(width: 100, height: 12)
                : Text(
                    controller.user.value.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: TColors.white),
                  ),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () => Get.to(
            () => const CartScreen(),
            transition: Transition.rightToLeftWithFade,
            curve: Curves.fastEaseInToSlowEaseOut,
            duration: const Duration(seconds: 1),
          ),
          iconColor: darkMode ? TColors.white : Colors.black,
        ),
      ],
    );
  }
}

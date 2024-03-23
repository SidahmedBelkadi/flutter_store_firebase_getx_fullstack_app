import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/appbar/appbar.dart';
import 'package:s_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:s_store/features/shop/screens/checkout/checkout.screen.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(
          TSizes.defaultSpace,
          TSizes.md,
          TSizes.defaultSpace,
          TSizes.md,
        ),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => const CheckoutScreen(),
            transition: Transition.rightToLeftWithFade,
            curve: Curves.fastEaseInToSlowEaseOut,
            duration: const Duration(seconds: 1),
          ),
          child: const Text("Checkout  \$256.00"),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: CartItems(),
        ),
      ),
    );
  }
}

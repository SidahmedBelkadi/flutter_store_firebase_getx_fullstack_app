import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/appbar/appbar.dart';
import 'package:s_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:s_store/common/widgets/products/cart/copoun_widget.dart';
import 'package:s_store/common/widgets/success_screen/success_screen.dart';
import 'package:s_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:s_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:s_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:s_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:s_store/navigation_menu.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // --- Items in cart
              const CartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              // --- Coupon TextField
              const CopounCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // --- Billing Section
              CircularContainer(
                showBorder: true,
                backgroundColor: darkMode ? TColors.black : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    //  Pricing
                    BillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //  Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //  Payment Methods
                    BillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //  Address
                    BillingAdressSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
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
            () => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: "Payment Success!",
              subtitle: "Your product will ne shipped soon",
              onPressed: () => Get.offAll(
                () => const NavigationMenu(),
                transition: Transition.rightToLeftWithFade,
                curve: Curves.fastEaseInToSlowEaseOut,
                duration: const Duration(seconds: 1),
              ),
            ),
            transition: Transition.rightToLeftWithFade,
            curve: Curves.fastEaseInToSlowEaseOut,
            duration: const Duration(seconds: 1),
          ),
          child: const Text("Checkout  \$256.00"),
        ),
      ),
    );
  }
}

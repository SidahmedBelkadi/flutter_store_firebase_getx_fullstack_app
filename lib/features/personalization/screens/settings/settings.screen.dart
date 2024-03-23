import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/widgets/appbar/appbar.dart';
import 'package:s_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:s_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:s_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:s_store/common/widgets/loader/form_loader.dart';
import 'package:s_store/common/widgets/texts/section_title.dart';
import 'package:s_store/features/authentication/controllers/sign_out/sign_out.controller.dart';
import 'package:s_store/features/personalization/screens/address/addresses.screen.dart';
import 'package:s_store/features/shop/screens/cart/cart.screen.dart';
import 'package:s_store/features/shop/screens/order/order.screen.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/dialog_helper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignOutController signOutController = Get.put(SignOutController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // --- Header
              PrimaryHeaderContainer(
                height: 130,
                child: Column(
                  children: [
                    // --- AppBar
                    CustomAppBar(
                      title: Text(
                        "Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.white),
                      ),
                    ),

                    // --- User Profile Card
                    const UserProfileTile(),
                  ],
                ),
              ),

              // --- Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    // --- Account settings
                    const SectionHeading(title: "Account Settings"),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    SettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: "My adresses",
                      subTitle: "Set shopping delivery address",
                      onTap: () => Get.to(
                        () => const AddressesScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(seconds: 1),
                      ),
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subTitle: "Add, remove products and move to checkout",
                      onTap: () => Get.to(
                        () => const CartScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(seconds: 1),
                      ),
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: "My Orders",
                      subTitle: "In-progress and Completed Order",
                      onTap: () => Get.to(
                        () => const OrderScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(seconds: 1),
                      ),
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.bank,
                      title: "Bank Account",
                      subTitle: "Withdraw balance to registered bank account",
                      onTap: () {},
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subTitle: "List of all the discounted coupons",
                      onTap: () {},
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subTitle: "Set any kind of all the discounted coupons",
                      onTap: () {},
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subTitle: "Manage data usage and connected accounts",
                      onTap: () {},
                    ),

                    // --- App Settings
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const SectionHeading(title: "App Settings"),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: "Load Data",
                      subTitle: "Upload data to your cloud firebase",
                      onTap: () {},
                    ),

                    SettingsMenuTile(
                      icon: Iconsax.location,
                      title: "Geolocation",
                      subTitle: "Set recommendation based on location",
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: "Safe Mode",
                      subTitle: "Search result is safe for all ages",
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.image,
                      title: "HD Image Quality",
                      subTitle: "Set Image quality to be seen",
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),

                    // --- Logout
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: Obx(
                        () => OutlinedButton(
                            onPressed: () => AppDialog.logoutDialog(
                                  onConfirm: () => signOutController.signOut(),
                                ),
                            child: signOutController.isLoading.value
                                ? const AppFormLoader2()
                                : const Text("Logout")),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

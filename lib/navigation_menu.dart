import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/features/personalization/screens/settings/settings.screen.dart';
import 'package:s_store/features/shop/screens/home/home.screen.dart';
import 'package:s_store/features/shop/screens/store/store.screen.dart';
import 'package:s_store/features/shop/screens/wishlist/wishlist.screen.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (value) =>
              controller.onDestinationSelected(value),
          backgroundColor: darkMode ? Colors.black : Colors.white,
          indicatorColor: darkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          indicatorShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          destinations: [
            BottomNavigationItemWrapper(
              darkMode: darkMode,
              selectedIndex: controller.selectedIndex.value,
              itemIndex: 0,
              child: NavigationDestination(
                  icon: Icon(controller.selectedIndex.value == 0
                      ? Iconsax.home5
                      : Iconsax.home),
                  label: 'Home'),
            ),
            BottomNavigationItemWrapper(
              darkMode: darkMode,
              selectedIndex: controller.selectedIndex.value,
              itemIndex: 1,
              child: NavigationDestination(
                  icon: Icon(controller.selectedIndex.value == 1
                      ? Iconsax.shop5
                      : Iconsax.shop),
                  label: 'Store'),
            ),
            BottomNavigationItemWrapper(
              darkMode: darkMode,
              selectedIndex: controller.selectedIndex.value,
              itemIndex: 2,
              child: NavigationDestination(
                  icon: Icon(controller.selectedIndex.value == 2
                      ? Iconsax.heart5
                      : Iconsax.heart),
                  label: 'Wishlist'),
            ),
            BottomNavigationItemWrapper(
              darkMode: darkMode,
              selectedIndex: controller.selectedIndex.value,
              itemIndex: 3,
              child: NavigationDestination(
                  icon: Icon(controller.selectedIndex.value == 3
                      ? Icons.person_2
                      : Iconsax.user),
                  label: 'Profile'),
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class BottomNavigationItemWrapper extends StatelessWidget {
  const BottomNavigationItemWrapper(
      {super.key,
      required this.child,
      required this.darkMode,
      required this.selectedIndex,
      required this.itemIndex});

  final Widget child;
  final bool darkMode;
  final int selectedIndex;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == itemIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: isSelected
          ? Container(
              decoration: BoxDecoration(
                border: Border(
                  top: isSelected
                      ? BorderSide(
                          width: 3,
                          color: darkMode ? Colors.white : Colors.black,
                        )
                      : BorderSide.none,
                ),
              ),
              child: child,
            ).animate().scale().then().shake()
          : AnimatedContainer(
              decoration: BoxDecoration(
                border: Border(
                  top: isSelected
                      ? BorderSide(
                          width: 3,
                          color: darkMode ? Colors.white : Colors.black,
                        )
                      : BorderSide.none,
                ),
              ),
              duration: const Duration(seconds: 1),
              child: child,
            ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    const SettingsScreen(),
  ];

  void onDestinationSelected(value) {
    selectedIndex.value = value;
  }
}

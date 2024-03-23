import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:s_store/features/authentication/screens/login/login.screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  final deviceStorage = GetStorage();

  // Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      deviceStorage.write("isFirstTime", false);

      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update current index & jump to last page
  void skipPage() {
    deviceStorage.write("isFirstTime", false);

    Get.to(
      () => const LoginScreen(),
      transition: Transition.rightToLeftWithFade,
      curve: Curves.fastEaseInToSlowEaseOut,
      duration: const Duration(seconds: 1),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class AppSnackBar {
  AppSnackBar._();

  static offlineSnackBar() {
    return Get.snackbar(
      "Oops!",
      "No Intenet Connection.",
      margin: const EdgeInsets.all(TSizes.sm),
      duration: const Duration(days: 1),
      backgroundColor: Colors.red,
      colorText: Colors.black,
      isDismissible: false,
      icon: LottieBuilder.asset(
        "assets/images/animations/offline.json",
        width: 150,
      ),
    );
  }

  static warningSnackBar({required String message, String title = "Warning"}) {
    return Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 3),
      backgroundColor: const Color.fromARGB(255, 255, 222, 102),
      colorText: Colors.black,
    );
  }

  static successSnackBar(
      {String title = "Congratulations", required String message}) {
    return Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 5),
      backgroundColor: TColors.primary,
      colorText: Colors.white,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/utils/constants/colors.dart';

class AppDialog {
  AppDialog._();

  static privacyPolicyDialog({required Function()? onConfirm}) {
    return Get.defaultDialog(
      barrierDismissible: false,
      title: "Accept privacy plicy",
      content: const Text(
          "In order to create your account your have to read and accept the privacy policy & terms of use."),
      actions: [
        ElevatedButton(
          onPressed: onConfirm,
          child: const Text("Accept"),
        ),
      ],
    );
  }

  static logoutDialog({required Function()? onConfirm}) {
    return Get.defaultDialog(
      barrierDismissible: false,
      title: "Sign out",
      content: const Text("Do you really want to logout ?"),
      actions: [
        MaterialButton(
          onPressed: () => Get.back(),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: TColors.grey,
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: TColors.black,
            ),
          ),
        ),
        MaterialButton(
          onPressed: onConfirm,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: TColors.primary,
          child: const Text(
            "Confirm",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: TColors.white,
            ),
          ),
        ),
      ],
    );
  }

  static deleteAccountWarningDialog({required Function()? onConfirm}) {
    return Get.defaultDialog(
      barrierDismissible: false,
      title: "Delete Account",
      content: const Text(
          "Do you really want to delete your account? not that this operation is permament ."),
      actions: [
        MaterialButton(
          onPressed: () => Get.back(),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: TColors.grey,
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: TColors.black,
            ),
          ),
        ),
        MaterialButton(
          onPressed: onConfirm,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.red,
          child: const Text(
            "Confirm",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: TColors.white,
            ),
          ),
        ),
      ],
    );
  }
}

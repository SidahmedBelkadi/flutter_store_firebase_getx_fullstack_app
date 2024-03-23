import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/data/repositories/user/user.repository.dart';
import 'package:s_store/features/personalization/controllers/user.controller.dart';
import 'package:s_store/features/personalization/screens/profile/profile.screen.dart';
import 'package:s_store/utils/helpers/network_manager.dart';
import 'package:s_store/utils/helpers/snackbar_helper.dart';

class UpdateNameController extends GetxController {
  RxBool isLoading = false.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  // --- Initailze the fields with the old name
  void initializeName() {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // --- check netwrok connection
      final isConnected = await NetworkController.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // --- check form validation
      FormState? formData = updateNameFormKey.currentState;
      if (!formData!.validate()) {
        return;
      }

      // --- update user first & last name

      Map<String, dynamic> name = {
        "FirstName": firstName.text.trim(),
        "LastName": lastName.text.trim()
      };

      isLoading(true);

      await UserRepository.updateSingleField(json: name);

      // Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      AppSnackBar.successSnackBar(message: "Your Name has been updated.");

      Get.off(
        () => const ProfileScreen(),
        transition: Transition.rightToLeft,
      );
    } catch (e) {
      AppSnackBar.warningSnackBar(message: e.toString());
    } finally {
      isLoading(false);
    }
  }
}

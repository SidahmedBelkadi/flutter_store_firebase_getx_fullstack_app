import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/data/repositories/authentication/authentication.repository.dart';
import 'package:s_store/features/authentication/screens/password_configuration/reset_password.screen.dart';
import 'package:s_store/utils/helpers/network_manager.dart';
import 'package:s_store/utils/helpers/snackbar_helper.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // --- Variables
  final email = TextEditingController();
  RxBool isLoading = false.obs;
  GlobalKey<FormState> forgetPasswordFormState = GlobalKey<FormState>();

  // --- Send reset Password email
  Future<void> sendPasswordResetEmail() async {
    try {
      // --- check netwrok connection
      final isConnected = await NetworkController.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // --- check form validation
      FormState? formData = forgetPasswordFormState.currentState;
      if (!formData!.validate()) {
        return;
      }

      isLoading(true);

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      isLoading(false);

      AppSnackBar.successSnackBar(
        title: "Email Sent",
        message: "Email Link Sent to reset your password",
      );

      Get.to(
        () => ResetPasswordScreen(
          email: email.text,
        ),
        transition: Transition.rightToLeft,
        duration: const Duration(seconds: 1),
      );
    } catch (e) {
      isLoading(false);
      AppSnackBar.warningSnackBar(message: e.toString());
    }
  }

  Future<void> rsendPasswordResetEmail({required String email}) async {
    try {
      // --- check netwrok connection
      final isConnected = await NetworkController.instance.isConnected();
      if (!isConnected) {
        return;
      }

      isLoading(true);

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      isLoading(false);

      AppSnackBar.successSnackBar(
        title: "Email Sent",
        message: "Email Link Sent to reset your password",
      );
    } catch (e) {
      isLoading(false);
      AppSnackBar.warningSnackBar(message: e.toString());
    }
  }
}

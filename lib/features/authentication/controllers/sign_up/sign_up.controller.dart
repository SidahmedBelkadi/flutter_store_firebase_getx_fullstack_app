import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/data/repositories/authentication/authentication.repository.dart';
import 'package:s_store/data/repositories/user/user.repository.dart';
import 'package:s_store/features/authentication/models/user.model.dart';
import 'package:s_store/features/authentication/screens/signup/verify_email.screen.dart';
import 'package:s_store/utils/helpers/dialog_helper.dart';
import 'package:s_store/utils/helpers/network_manager.dart';
import 'package:s_store/utils/helpers/snackbar_helper.dart';

class SignupController extends GetxController {
  // ---- VARIABLES
  final RxBool hidePassword = true.obs;
  final RxBool privacyPolicy = false.obs;
  final RxBool isLoading = false.obs;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // ---- SIGNUP
  Future<void> signup() async {
    try {
      // --- check netwrok connection
      final isConnected = await NetworkController.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // --- check form validation
      FormState? formData = signupFormKey.currentState;
      if (!formData!.validate()) {
        return;
      }

      // --- check privacy policy
      if (!privacyPolicy.value) {
        AppDialog.privacyPolicyDialog(
          onConfirm: () {
            privacyPolicy.value = true;
            Get.back();
          },
        );
        return;
      }

      // --- Register user in the firebase authentication & save user data in firebase
      isLoading(true);
      final userCredential = await AuthenticationRepository.instance
          .signUpWithEmailAndPassword(email.text.trim(), password.text.trim());

      // --- Save the authenticated user data in firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      await UserRepository.saveUserRecord(user: newUser);

      isLoading(false);

      AppSnackBar.successSnackBar(
        title: "Congratulations",
        message:
            "Your account has been created, please verify your email to continue",
      );

      Get.off(
        () => const VerifyEmailScreen(),
        arguments: {'email': email.text},
        transition: Transition.rightToLeft,
        duration: const Duration(seconds: 1),
      );
    } catch (e) {
      isLoading(false);
      AppSnackBar.warningSnackBar(message: e.toString());
    }
  }

  void togglePassword() {
    hidePassword.value = !hidePassword.value;
  }

  void togglePrivacyPolicy() {
    privacyPolicy.value = !privacyPolicy.value;
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    username.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }
}

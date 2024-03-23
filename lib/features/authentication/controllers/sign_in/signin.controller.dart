import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:s_store/common/widgets/loader/full_screen_loader.dart';
import 'package:s_store/data/repositories/authentication/authentication.repository.dart';
import 'package:s_store/features/personalization/controllers/user.controller.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/helpers/network_manager.dart';
import 'package:s_store/utils/helpers/snackbar_helper.dart';

class SignInConroller extends GetxController {
  // --- Variables
  RxBool rememberMe = false.obs;
  RxBool hidePassword = true.obs;
  RxBool isLoading = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  final localStorage = GetStorage();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? '';
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? '';
    super.onInit();
  }

  // ---- SIGNIN USING EMAIL & PASSWORD
  Future<void> signin() async {
    try {
      // --- check netwrok connection
      final isConnected = await NetworkController.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // --- check form validation
      FormState? formData = signInFormKey.currentState;
      if (!formData!.validate()) {
        return;
      }

      // --- Save data if remember is checked
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text);
        localStorage.write("REMEMBER_ME_PASSWORD", password.text);
      }

      // --- Login user in the firebase authentication
      isLoading(true);
      await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      isLoading(false);

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      isLoading(false);
      AppSnackBar.warningSnackBar(message: e.toString());
    }
  }

  // ---- SIGNIN USING EMAIL & PASSWORD
  Future<void> signinWithGoogle() async {
    try {
      final isConnected = await NetworkController.instance.isConnected();
      if (!isConnected) {
        return;
      }

      TFullScreenLoader.openLoadingDialog(
        "Loggin you ...",
        TImages.docerAnimation,
      );

      // Google authentication
      final userCredentails =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentails);
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      AppSnackBar.warningSnackBar(message: e.toString());
    }
  }

  void togglePassword() {
    hidePassword.value = !hidePassword.value;
  }

  void toggleRemmemberMe() {
    rememberMe.value = !rememberMe.value;
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

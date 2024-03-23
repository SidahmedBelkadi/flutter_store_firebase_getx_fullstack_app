import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/success_screen/success_screen.dart';
import 'package:s_store/data/repositories/authentication/authentication.repository.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/text_strings.dart';
import 'package:s_store/utils/helpers/snackbar_helper.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // --- Variables
  late String email;

  // --- Send Email & Set Timer for auto redirect
  @override
  void onInit() {
    email = Get.arguments['email'];
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // --- Send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      AppSnackBar.successSnackBar(
        title: "Email Sent",
        message: "Please check your inbox and verify your email.",
      );
    } catch (e) {
      AppSnackBar.warningSnackBar(message: e.toString());
    }
  }

  // --- Timer to auto redirect on Email Verifiation
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: TTexts.yourAccountCreatedTitle,
              subtitle: TTexts.changeYourPasswordSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ), //
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(seconds: 1),
          );
        }
      },
    ); // Timer.periodic
  }

  // --- Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: TImages.successfulPaymentIcon,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.changeYourPasswordSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ), // SuccessScreen
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(seconds: 1),
      );
    } else {
      AppSnackBar.warningSnackBar(
          title: "Email verification",
          message: "Please verify your email to continue.");
    }
  }
}

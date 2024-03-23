import 'package:get/get.dart';
import 'package:s_store/data/repositories/authentication/authentication.repository.dart';
import 'package:s_store/features/authentication/screens/login/login.screen.dart';
import 'package:s_store/utils/helpers/network_manager.dart';
import 'package:s_store/utils/helpers/snackbar_helper.dart';

class SignOutController extends GetxController {
  RxBool isLoading = false.obs;

  // ---- SIGNUP
  Future<void> signOut() async {
    try {
      // --- check netwrok connection
      final isConnected = await NetworkController.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // --- Logout user in the firebase authentication
      isLoading(true);
      await AuthenticationRepository.instance.logout();

      isLoading(false);

      Get.offAll(
        () => const LoginScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(seconds: 1),
      );
    } catch (e) {
      isLoading(false);
      AppSnackBar.warningSnackBar(message: e.toString());
    }
  }
}

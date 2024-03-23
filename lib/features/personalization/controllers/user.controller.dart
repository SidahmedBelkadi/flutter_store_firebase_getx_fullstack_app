import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:s_store/data/repositories/user/user.repository.dart';
import 'package:s_store/features/authentication/models/user.model.dart';
import 'package:s_store/utils/helpers/snackbar_helper.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;
  RxBool deleteAccountLoading = false.obs;
  RxBool imageUploadLoading = false.obs;

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading(true);
      final user = await UserRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading(false);
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');
        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // save user data
        await UserRepository.saveUserRecord(user: user);
      }
    } catch (e) {
      AppSnackBar.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  Future<void> uploadImageProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery, imageQuality: 70, maxHeight: 512);
      if (image != null) {
        imageUploadLoading(true);

        // Upload Image
        final imageUrl = await UserRepository.uploadImage(
            path: "Users/Images/Profile", image: image);

        // Update user image record
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await UserRepository.updateSingleField(json: json);

        user.value.profilePicture = imageUrl;

        AppSnackBar.successSnackBar(message: "You image has been updated.");
      }
    } catch (e) {
      AppSnackBar.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    } finally {
      imageUploadLoading(false);
    }
  }
}

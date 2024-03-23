import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/shimmer/shimmer.dart';
import 'package:s_store/common/widgets/appbar/appbar.dart';
import 'package:s_store/common/widgets/images/circular_image.dart';
import 'package:s_store/common/widgets/loader/form_loader.dart';
import 'package:s_store/common/widgets/texts/section_title.dart';
import 'package:s_store/features/personalization/controllers/user.controller.dart';
import 'package:s_store/features/personalization/screens/profile/change_name.screen.dart';
import 'package:s_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = UserController.instance;

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Profile"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // --- Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            userController.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : TImages.user;
                        return userController.imageUploadLoading.value
                            ? const AppShimmerEffect(
                                width: 80,
                                height: 80,
                                radius: 100,
                              )
                            : CircularImage(
                                image: image,
                                height: 80,
                                width: 80,
                                padding: 0,
                                isNetworkImage: networkImage.isNotEmpty,
                              );
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Obx(
                      () => TextButton(
                        onPressed: () =>
                            userController.uploadImageProfilePicture(),
                        child: userController.imageUploadLoading.value
                            ? const AppFormLoader2(
                                height: 30,
                                width: 30,
                              )
                            : const Text("Change Profile Picture"),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections / 2),

                    // --- Details
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const SectionHeading(title: "Profile Information"),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // --- Heading Profile menu
                    ProfileMenu(
                      title: "Name",
                      value: userController.user.value.fullName,
                      onPressed: () => Get.off(
                        () => const ChangeNameScreen(),
                        transition: Transition.rightToLeft,
                      ),
                    ),
                    ProfileMenu(
                      title: "Username",
                      value: userController.user.value.username,
                      onPressed: () {},
                    ),

                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // --- Heading Personal info
                    const SectionHeading(title: "Personal information"),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    ProfileMenu(
                      title: "User Id",
                      value: userController.user.value.id,
                      onPressed: () {},
                      icon: Iconsax.copy,
                    ),
                    ProfileMenu(
                      title: "Email",
                      value: userController.user.value.email,
                      onPressed: () {},
                    ),
                    ProfileMenu(
                      title: "Phone Number",
                      value: userController.user.value.phoneNumber,
                      onPressed: () {},
                    ),
                    ProfileMenu(
                      title: "Gender",
                      value: "Male",
                      onPressed: () {},
                    ),
                    ProfileMenu(
                      title: "Date of birth",
                      value: "March 11, 2002",
                      onPressed: () {},
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

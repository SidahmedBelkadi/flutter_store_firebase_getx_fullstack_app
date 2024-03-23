import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/widgets/images/circular_image.dart';
import 'package:s_store/features/personalization/controllers/user.controller.dart';
import 'package:s_store/features/personalization/screens/profile/profile.screen.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();

    return ListTile(
      leading: CircularImage(
        image: userController.user.value.profilePicture.isNotEmpty
            ? userController.user.value.profilePicture
            : TImages.user,
        padding: 0,
        isNetworkImage: userController.user.value.profilePicture.isNotEmpty,
      ).animate().scale().then().shake(),
      title: Text(
        userController.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        userController.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(() => const ProfileScreen(),
            transition: Transition.rightToLeft),
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}

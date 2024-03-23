import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/widgets/appbar/appbar.dart';
import 'package:s_store/features/personalization/screens/address/add_new_address.screen.dart';
import 'package:s_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(
          () => const AddNewAddressScreen(),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(seconds: 1),
        ),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: const CustomAppBar(
        title: Text("My Addresses"),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(isSelectedAddress: true),
              SingleAddress(isSelectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}

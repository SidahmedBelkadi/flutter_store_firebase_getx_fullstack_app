import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/widgets/appbar/appbar.dart';
import 'package:s_store/common/widgets/loader/form_loader.dart';
import 'package:s_store/features/personalization/controllers/update_name.controller.dart';
// import 'package:s_store/features/personalization/controllers/user.controller.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_strings.dart';
import 'package:s_store/utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Change Name"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                // Heading
                Text(
                  "Use real name for easy  verification. This name will appear on several pages.",
                  style: Theme.of(context).textTheme.labelMedium,
                ),

                const SizedBox(height: TSizes.spaceBtwSections),

                // FirstName & LastName
                Form(
                  key: controller.updateNameFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstName,
                        validator: (value) => AppValidation.validateInput(
                          value: value!,
                          type: InputTypes.firstName,
                          inputName: "Firstname",
                          min: 6,
                          max: 30,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                        expands: false,
                        decoration: const InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TextFormField(
                        controller: controller.lastName,
                        validator: (value) => AppValidation.validateInput(
                            value: value!,
                            type: InputTypes.lastName,
                            inputName: "Lastname",
                            min: 6,
                            max: 30),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                        expands: false,
                        decoration: const InputDecoration(
                          labelText: TTexts.lastName,
                          prefixIcon: Icon(Iconsax.user),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.updateUserName(),
                    child: Obx(
                      () => controller.isLoading.value
                          ? const AppFormLoader()
                          : const Text(
                              "Save",
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

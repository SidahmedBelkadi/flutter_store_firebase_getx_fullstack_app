import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/widgets/loader/form_loader.dart';
import 'package:s_store/features/authentication/controllers/sign_up/sign_up.controller.dart';
import 'package:s_store/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:s_store/utils/validators/validation.dart';

import '../../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignUpForm extends GetView<SignupController> {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // FirstName & LastName
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: TextFormField(
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
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) => AppValidation.validateInput(
              value: value!,
              type: InputTypes.username,
              inputName: "Username",
              min: 6,
              max: 30,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => AppValidation.validateInput(
              value: value!,
              type: InputTypes.email,
              inputName: "Email Address",
              min: 8,
              max: 50,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => AppValidation.validateInput(
              value: value!,
              type: InputTypes.phone,
              inputName: "Phone Number",
              min: 9,
              max: 11,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => AppValidation.validateInput(
                value: value!,
                type: InputTypes.password,
                inputName: "Password",
                min: 8,
                max: 50,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              obscureText: controller.hidePassword.value,
              expands: false,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: GestureDetector(
                  onTap: () => controller.togglePassword(),
                  child: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          //   Terms & Conditions CheckBox
          const TermsAndConditionsCheckBox(),

          const SizedBox(height: TSizes.spaceBtwSections),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: Obx(() => controller.isLoading.value
                  ? const AppFormLoader()
                  : const Text(
                      TTexts.createAccount,
                    )),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          //   Divider
          FormDivider(dividerText: TTexts.orSignUpWith.capitalize!),

          const SizedBox(height: TSizes.spaceBtwSections),

          //   Social Buttons
          const FormSocialButtons()
        ],
      ),
    );
  }
}

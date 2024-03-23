import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/common/widgets/loader/form_loader.dart';
import 'package:s_store/features/authentication/controllers/sign_in/signin.controller.dart';
import 'package:s_store/features/authentication/screens/password_configuration/forget_password.screen.dart';
import 'package:s_store/features/authentication/screens/signup/signup.screen.dart';

import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_strings.dart';
import 'package:s_store/utils/validators/validation.dart';

class LoginForm extends GetView<SignInConroller> {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signInFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
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

            const SizedBox(height: TSizes.spaceBtwInputFields),

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

            //   Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //   Remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.toggleRemmemberMe(),
                      ),
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                //   Forget Password
                TextButton(
                  onPressed: () => Get.to(
                    () => const ForgetPasswordScreen(),
                    transition: Transition.rightToLeftWithFade,
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: const Duration(seconds: 1),
                  ),
                  child: const Text(TTexts.forgetPasswordTitle),
                ),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signin(),
                child: Obx(
                  () => controller.isLoading.value
                      ? const AppFormLoader()
                      : const Text(
                          TTexts.signIn,
                        ),
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 700)),
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

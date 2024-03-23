import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/login_signup/form_divider.dart';
import 'package:s_store/common/widgets/login_signup/social_buttons.dart';
import 'package:s_store/features/authentication/controllers/sign_in/signin.controller.dart';
import 'package:s_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:s_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInConroller());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // Logo & subtitle
                const LoginHeader(),

                //   Form
                const LoginForm(),

                // Divider
                FormDivider(
                  dividerText: TTexts.orSignInWith.capitalize!,
                ),

                const SizedBox(height: TSizes.spaceBtwSections),

                //   Footer
                const FormSocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

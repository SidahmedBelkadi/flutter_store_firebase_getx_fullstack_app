import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/features/authentication/controllers/sign_up/sign_up.controller.dart';
import 'package:s_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //   Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              //   Form
              const SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

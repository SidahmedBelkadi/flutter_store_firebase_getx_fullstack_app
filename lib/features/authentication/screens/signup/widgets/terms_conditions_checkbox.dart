import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/features/authentication/controllers/sign_up/sign_up.controller.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/text_strings.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class TermsAndConditionsCheckBox extends GetView<SignupController> {
  const TermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.togglePrivacyPolicy(),
            ),
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: TTexts.iAgreeTo,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: "${TTexts.privacyPolicy} ",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary),
              ),
              TextSpan(
                text: TTexts.and,
                // Replace with the actual text you want
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: "${TTexts.termsOfUse} ",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary),
              ),
            ],
          ),
        )
      ],
    );
  }
}

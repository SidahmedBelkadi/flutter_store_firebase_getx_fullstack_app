import 'package:flutter/material.dart';
import 'package:s_store/features/authentication/controllers/onBoarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: TextButton(
        onPressed: OnBoardingController.instance.skipPage,
        child: const Text('skip'),
      ),
    );
  }
}

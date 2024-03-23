import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/features/authentication/controllers/onBoarding/onboarding_controller.dart';
import 'package:s_store/features/authentication/screens/onBoarding/widgets/onBoarding_skip.dart';
import 'package:s_store/features/authentication/screens/onBoarding/widgets/onboarding_dot_navigation.dart';
import 'package:s_store/features/authentication/screens/onBoarding/widgets/onboarding_next_button.dart';
import 'package:s_store/features/authentication/screens/onBoarding/widgets/onboarding_page.dart';
import 'package:s_store/utils/constants/image_strings.dart';
import 'package:s_store/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Horizontal scrollable pages
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnBoardingPage(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle1,
                  subtitle: TTexts.onBoardingSubTitle1,
                ),
                OnBoardingPage(
                  image: TImages.onBoardingImage2,
                  title: TTexts.onBoardingTitle2,
                  subtitle: TTexts.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                  image: TImages.onBoardingImage3,
                  title: TTexts.onBoardingTitle3,
                  subtitle: TTexts.onBoardingSubTitle3,
                ),
              ],
            ),

            // Skip button
            const OnBoardingSkip(),

            // Dot Navigation Smooth page indicator
            const OnBoardingNavigation(),

            // Circular Button
            const OnBoardingNextButton()
          ],
        ),
      ),
    );
  }
}

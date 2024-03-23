import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class AppFormLoader extends StatelessWidget {
  const AppFormLoader({super.key, this.height = 30, this.width = 40});

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      "assets/images/animations/loading_fom_white.json",
      height: height,
      width: width,
    );
  }
}

class AppFormLoader2 extends StatelessWidget {
  const AppFormLoader2({super.key, this.height = 30, this.width = 40});
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      "assets/images/animations/loading_form.json",
      height: height,
      width: width,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import 'circular_container.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
    this.height = 330,
    this.color = TColors.primary,
    this.isDecorated = true,
  });

  final double height;
  final Widget child;
  final Color color;
  final bool isDecorated;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          if (isDecorated)
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                height: 400,
                width: 400,
                radius: 400,
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
          if (isDecorated)
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                height: 400,
                width: 400,
                radius: 400,
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
          child,
        ],
      ),
    );
  }
}

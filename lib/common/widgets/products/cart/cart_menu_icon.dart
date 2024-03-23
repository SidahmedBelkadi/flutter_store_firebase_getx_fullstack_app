import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    this.iconColor = Colors.white,
    required this.onPressed,
  });

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            alignment: Alignment.center,
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                color: iconColor, borderRadius: BorderRadius.circular(100)),
            child: Text('2',
                style: darkMode
                    ? Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: Colors.black)
                    : Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: Colors.white)),
          ),
        )
      ],
    );
  }
}

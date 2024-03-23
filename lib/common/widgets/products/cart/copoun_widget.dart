import 'package:flutter/material.dart';
import 'package:s_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CopounCode extends StatelessWidget {
  const CopounCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return CircularContainer(
      showBorder: true,
      backgroundColor: darkMode ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
        top: TSizes.sm,
        bottom: TSizes.sm,
        right: TSizes.sm,
        left: TSizes.md,
      ),
      child: Row(
        children: [
          // TextField
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter coupon code",
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),

          // --- Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: darkMode
                      ? TColors.white.withOpacity(.5)
                      : TColors.dark.withOpacity(.5),
                  backgroundColor: Colors.grey.withOpacity(.2),
                  side: BorderSide(color: Colors.grey.withOpacity(.2))),
              child: const Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }
}

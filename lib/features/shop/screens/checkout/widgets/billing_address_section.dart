import 'package:flutter/material.dart';
import 'package:s_store/common/widgets/texts/section_title.dart';
import 'package:s_store/utils/constants/sizes.dart';

class BillingAdressSection extends StatelessWidget {
  const BillingAdressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        SectionHeading(
          title: "Shipping Address",
          buttonTitle: "Change",
          showActionButton: true,
          onPressed: () {},
        ),
        Text(
          "Sidahmed Belkadi's Home",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 20,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              "+213 669 89 61 93",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 20,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: Text(
                "Ouled Moussa, Evolitive City, N 15, Boumerdes Algeria.",
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -- SubTotal

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$256", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // -- Shipping
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // -- Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // -- Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$6.0", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}

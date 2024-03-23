import 'package:flutter/material.dart';
import 'package:s_store/features/shop/screens/product_reviews/widgets/progress_indicator_and_ratings.dart';

class OverAllProductRating extends StatelessWidget {
  const OverAllProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 5,
          child: Column(
            children: [
              RatingProgressIndicator(text: "5", value: 1.0),
              RatingProgressIndicator(text: "4", value: 0.8),
              RatingProgressIndicator(text: "3", value: 0.6),
              RatingProgressIndicator(text: "2", value: 0.4),
              RatingProgressIndicator(text: "1", value: 0.2),
            ],
          ),
        ),
      ],
    );
  }
}

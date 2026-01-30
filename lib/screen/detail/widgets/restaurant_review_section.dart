import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/data/models/review_model.dart';
import 'package:resto_app_dicoding/screen/detail/widgets/resturant_add_review_form.dart';
import 'package:resto_app_dicoding/screen/detail/widgets/resturant_review_card.dart';

class RestaurantReviewSection extends StatelessWidget {
  final String restaurantId;
  final List<Review> reviews;

  const RestaurantReviewSection({
    super.key,
    required this.restaurantId,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        Text(
          'Customer Reviews',
          style: textTheme.titleLarge,
        ),

        const SizedBox(height: 12),

        /// EMPTY STATE
        if (reviews.isEmpty)
          Text(
            'No reviews yet',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),

        /// REVIEW LIST (AMAN DALAM SLIVER)
        Column(
          children: reviews
              .map((review) => ReviewCard(review: review))
              .toList(),
        ),

        const SizedBox(height: 24),
        const Divider(),
        const SizedBox(height: 16),

        /// ADD REVIEW FORM
        AddReviewForm(
          restaurantId: restaurantId,
        ),
      ],
    );
  }
}

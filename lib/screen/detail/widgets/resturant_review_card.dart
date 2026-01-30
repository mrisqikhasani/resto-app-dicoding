import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/data/models/review_model.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// NAME + DATE
          Row(
            children: [
              Expanded(
                child: Text(
                  review.name,
                  style: textTheme.titleMedium,
                ),
              ),
              Text(
                review.date,
                style: textTheme.bodySmall,
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// REVIEW TEXT
          Text(
            review.review,
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

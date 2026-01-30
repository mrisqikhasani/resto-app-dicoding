import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:resto_app_dicoding/style/restaurant_color.dart';
import 'package:resto_app_dicoding/style/typography/restaurant_text_style.dart';
import 'package:resto_app_dicoding/utils/image_helper.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantItem restaurant;
  final Function() onTap;

  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 120,
                minHeight: 90,
                maxWidth: 120,
                minWidth: 120,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(
                    ImageHelper.small(restaurant.pictureId),
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: RestaurantColor.primary.withValues(alpha: 0.2),
                      child: const Icon(Icons.broken_image),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 15),

            /// CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    restaurant.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          restaurant.city,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// RATING
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: RestaurantColor.rating,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        restaurant.rating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

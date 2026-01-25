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
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: RestaurantColor.primary.withValues(alpha: 0.1),
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IMAGE
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 110,
                  maxWidth: 110,
                  minHeight: 110,
                  maxHeight: 110,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Hero(
                    tag: restaurant.pictureId,
                    child: Image.network(
                      ImageHelper.small(restaurant.pictureId),
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: RestaurantColor.primary,
                        child: const Icon(Icons.broken_image, size: 40),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              /// CONTENT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// NAME
                    Text(
                      restaurant.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: RestaurantTextStyle.titleMedium,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      restaurant.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: RestaurantTextStyle.bodySmall,
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              restaurant.city,
                              style: RestaurantTextStyle.bodyMedium,
                            ),
                          ],
                        ),

                        const SizedBox(width: 12),

                        /// RATING
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: RestaurantColor.rating,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              restaurant.rating.toString(),
                              style: RestaurantTextStyle.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:resto_app_dicoding/utils/image_helper.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantItem restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: restaurant.id,
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
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
                        color: Colors.grey.shade300,
                        child: const Icon(
                          Icons.broken_image,
                          size: 40,
                        ),
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
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// DESCRIPTION (ELLIPSIS)
                    Text(
                      restaurant.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodySmall,
                    ),

                    const SizedBox(height: 10),

                    /// INFO ROW
                    Row(
                      children: [
                        /// CITY
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              restaurant.city,
                              style: textTheme.bodySmall,
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
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              restaurant.rating.toString(),
                              style: textTheme.bodySmall,
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

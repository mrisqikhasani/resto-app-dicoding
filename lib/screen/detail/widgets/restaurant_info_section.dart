import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/data/models/restaurant_detail_model.dart';
import 'package:resto_app_dicoding/style/restaurant_color.dart';

class RestaurantInfoSection extends StatelessWidget {
  final RestaurantDetail restaurant;

  const RestaurantInfoSection({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LOCATION
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 18,
              color: RestaurantColor.primary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${restaurant.address}, ${restaurant.city}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.star, size: 16, color: RestaurantColor.rating),
            const SizedBox(height: 4),
            Text(
              restaurant.rating.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}

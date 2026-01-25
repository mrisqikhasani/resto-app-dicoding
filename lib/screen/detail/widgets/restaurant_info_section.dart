import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/data/models/restaurant_detail_model.dart';
import 'package:resto_app_dicoding/style/restaurant_color.dart';
import 'package:resto_app_dicoding/style/typography/restaurant_text_style.dart';

class RestaurantInfoSection extends StatelessWidget{
  final RestaurantDetail restaurant;

  const RestaurantInfoSection({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(restaurant.city, style: RestaurantTextStyle.bodySmall),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.star, size: 16, color: RestaurantColor.rating),
            const SizedBox(height: 4),
            Text(
              restaurant.rating.toString(),
              style: RestaurantTextStyle.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}

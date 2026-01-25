import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/data/models/restaurant_detail_model.dart';
import 'package:resto_app_dicoding/style/typography/restaurant_text_style.dart';

class RestaurantDescriptionSection extends StatelessWidget {
  final RestaurantDetail restaurant;

  const RestaurantDescriptionSection({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: RestaurantTextStyle.titleMedium),
        const SizedBox(height: 8),
        Text(restaurant.description, style: RestaurantTextStyle.bodyMedium),
      ],
    );
  }
}

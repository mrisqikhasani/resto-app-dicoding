import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/data/models/drink_model.dart';
import 'package:resto_app_dicoding/data/models/food_model.dart';
import 'package:resto_app_dicoding/style/restaurant_color.dart';
import 'package:resto_app_dicoding/style/typography/restaurant_text_style.dart';

class RestaurantMenuSection extends StatelessWidget {
  final List<Food> foods;
  final List<Drink> drinks;

  const RestaurantMenuSection({super.key, required this.foods, required this.drinks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Menu',
          style: RestaurantTextStyle.titleMedium,
        ),
        const SizedBox(height: 8),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ...foods.map(
              (food) => Chip(
                label: Text(food.name),
                backgroundColor:
                    RestaurantColor.accent,
              ),
            ),
            ...drinks.map(
              (drink) => Chip(
                label: Text(drink.name),
                backgroundColor:
                    RestaurantColor.accent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/data/models/drink_model.dart';
import 'package:resto_app_dicoding/data/models/food_model.dart';
import 'package:resto_app_dicoding/style/restaurant_color.dart';

class RestaurantMenuSection extends StatelessWidget {
  final List<Food> foods;
  final List<Drink> drinks;

  const RestaurantMenuSection({
    super.key,
    required this.foods,
    required this.drinks,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Menu',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 16),

        /// 🍜 FOODS
        _MenuGroup(
          title: 'Foods',
          icon: Icons.restaurant,
          items: foods.map((e) => e.name).toList(),
        ),

        const SizedBox(height: 20),

        /// 🥤 DRINKS
        _MenuGroup(
          title: 'Drinks',
          icon: Icons.local_drink,
          items: drinks.map((e) => e.name).toList(),
        ),
      ],
    );
  }
}

class _MenuGroup extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> items;

  const _MenuGroup({
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: RestaurantColor.primary),
            const SizedBox(width: 6),
            Text(title, style: textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: 10),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items
              .map(
                (item) => Chip(
                  label: Text(item),
                  backgroundColor: RestaurantColor.accent.withValues(
                    alpha: 0.15,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

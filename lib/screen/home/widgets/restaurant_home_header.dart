import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/style/restaurant_color.dart';

class RestaurantHomeHeader extends StatelessWidget {
  const RestaurantHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.restaurant_menu, size: 30, color: RestaurantColor.primary,),
              const SizedBox(width: 8),
              Text(
                'Restaurant',
                style: Theme.of(context).textTheme.headlineSmall,
                // style: RestaurantTextStyle.headlineLarge,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Find your favorite meals today',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:resto_app_dicoding/screen/home/widgets/restaurant_card.dart';

class RestaurantListView extends StatelessWidget{
  final List<RestaurantItem> restaurants;

  const RestaurantListView({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    if(restaurants.isEmpty) {
      return const Center(
        child: Text('Restorant tidak ditemukan'),
      );
    }

   return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return RestaurantCard(
          restaurant: restaurants[index],
        );
      },
   );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/provider/search/restaurant_search_provider.dart';

class SearchTextFieldWidget extends StatelessWidget{
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari restoran...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onChanged: (value) {
          context.read<RestaurantSearchProvider>()
              .searchRestaurant(value);
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/provider/search/restaurant_search_provider.dart';
import 'package:resto_app_dicoding/screen/home/widgets/restaurant_card.dart';
import 'package:resto_app_dicoding/screen/search/widget/search_empty_state.dart';
import 'package:resto_app_dicoding/core/navigation/navigation_route.dart';
import 'package:resto_app_dicoding/core/state/result_state.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantSearchProvider>(
      builder: (context, value, child) {
        switch (value.state) {
          case ResultState.loading:
            return const Center(child: CircularProgressIndicator());

          case ResultState.error:
            debugPrint("adds on value ${value.message}");
            return Center(child: Text(value.message));

          case ResultState.success:
            if (value.results.isEmpty) {
              return const SearchEmptyState();
            }

            return ListView.builder(
              itemCount: value.results.length,
              itemBuilder: (context, index) {
                return RestaurantCard(
                  restaurant: value.results[index],
                  onTap: () => Navigator.pushNamed(
                    context,
                    NavigationRoute.detailRoute.name,
                    arguments: value.results[index].id,
                  ),
                );
              },
            );

          default:
            return const Center(child: Text('Cari restoran favoritmu'));
        }
      },
    );
  }
}

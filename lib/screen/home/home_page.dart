import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/core/state/result_state.dart';
import 'package:resto_app_dicoding/provider/home/restaurant_list_provider.dart';
import 'package:resto_app_dicoding/screen/home/widgets/restaurant_list_view.dart';
import 'package:resto_app_dicoding/screen/widgets/error_state_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Restaurant List",), centerTitle: true),
      body: Consumer<RestaurantListProvider>(
        builder: (context, value, child) {
          switch (value.state) {
            case ResultState.loading:
              return const Center(child: CircularProgressIndicator());

            case ResultState.error:
              return ErrorStateWidget(
                message: value.message,
                onRetry: () => context
                    .read<RestaurantListProvider>()
                    .fetchRestaurantList(),
              );

            case ResultState.success:
              // debugPrint("the data from other value ${value.restaurants}");
              return RestaurantListView(restaurants: value.restaurants);

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

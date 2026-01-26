import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/core/navigation/navigation_route.dart';
import 'package:resto_app_dicoding/core/state/result_state.dart';
import 'package:resto_app_dicoding/provider/home/restaurant_list_provider.dart';
import 'package:resto_app_dicoding/provider/theme/theme_provider.dart';
import 'package:resto_app_dicoding/screen/home/widgets/restaurant_home_header.dart';
import 'package:resto_app_dicoding/screen/home/widgets/restaurant_list_view.dart';
import 'package:resto_app_dicoding/screen/widgets/error_state_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (mounted) {
        context.read<RestaurantListProvider>().fetchRestaurantList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant List'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'theme') {
                context.read<ThemeProvider>().toggleTheme();
              } else if (value == 'search') {
                Navigator.pushNamed(context, NavigationRoute.searchRoute.name);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'search',
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: Text('Search'),
                ),
              ),
              const PopupMenuItem(
                value: 'theme',
                child: ListTile(
                  leading: Icon(Icons.brightness_6),
                  title: Text('Dark / Light'),
                ),
              ),
            ],
          ),
        ],
      ),

      body: Column(
        children: [
          const RestaurantHomeHeader(),
          Expanded(
            child: Consumer<RestaurantListProvider>(
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
                    return RestaurantListView(restaurants: value.restaurants);

                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

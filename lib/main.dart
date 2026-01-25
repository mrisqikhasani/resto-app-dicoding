import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/core/navigation/navigation_route.dart';
import 'package:resto_app_dicoding/data/api/api_service.dart';
import 'package:resto_app_dicoding/data/repositories/restaurant_repository.dart';
import 'package:resto_app_dicoding/provider/home/restaurant_list_provider.dart';
import 'package:resto_app_dicoding/provider/theme/theme_provider.dart';
import 'package:resto_app_dicoding/screen/detail/restaurant_detail_page.dart';
import 'package:resto_app_dicoding/screen/home/home_page.dart';
import 'package:resto_app_dicoding/style/theme/restaurants_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (context) => RestaurantListProvider(
            repository: RestaurantRepository(apiService: ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => RestaurantListProvider(
            repository: RestaurantRepository(apiService: ApiService()),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo Again',
      theme: RestaurantsTheme.lightTheme,
      darkTheme: RestaurantsTheme.darkTheme,
      themeMode: themeProvider.themeModa,
      // home: const HomePage(),
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const HomePage(),
        NavigationRoute.detailRoute.name: (context) => RestaurantDetailPage(
          restaurantId: ModalRoute.of(context)?.settings.arguments as String,
        ),
      },
    );
  }
}

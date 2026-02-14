import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/core/navigation/navigation_route.dart';
import 'package:resto_app_dicoding/data/api/api_service.dart';
import 'package:resto_app_dicoding/data/local/local_databaser_service.dart';
import 'package:resto_app_dicoding/data/repositories/restaurant_repository.dart';
import 'package:resto_app_dicoding/provider/Notification/reminder_provider.dart';
import 'package:resto_app_dicoding/provider/bookmark/bookmark_icon_provider.dart';
import 'package:resto_app_dicoding/provider/bookmark/bookmark_list_provider.dart';
import 'package:resto_app_dicoding/provider/detail/add_review_provider.dart';
import 'package:resto_app_dicoding/provider/detail/restaurant_detail_provider.dart';
import 'package:resto_app_dicoding/provider/home/restaurant_list_provider.dart';
import 'package:resto_app_dicoding/provider/main/index_nav_provider.dart';
import 'package:resto_app_dicoding/provider/search/restaurant_search_provider.dart';
import 'package:resto_app_dicoding/provider/theme/theme_provider.dart';
import 'package:resto_app_dicoding/screen/detail/restaurant_detail_page.dart';
import 'package:resto_app_dicoding/screen/home/main_screen.dart';
import 'package:resto_app_dicoding/screen/search/restaurant_search_page.dart';
import 'package:resto_app_dicoding/screen/settings/settings_page.dart';
import 'package:resto_app_dicoding/services/local_notification_services.dart';
import 'package:resto_app_dicoding/style/theme/restaurants_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final notificationService = LocalNotificationService();

  await notificationService.init();

  await notificationService.requestPermissions();

  runApp(
    MultiProvider(
      providers: [
        /// Inject notification service (shared instance)
        Provider<LocalNotificationService>.value(
          value: notificationService,
        ),

        /// Reminder Provider
        ChangeNotifierProvider(
          create: (_) => ReminderProvider(notificationService),
        ),

        /// Theme
        ChangeNotifierProvider(create: (_) => ThemeProvider()),

        /// Restaurant List
        ChangeNotifierProvider(
          create: (_) => RestaurantListProvider(
            repository: RestaurantRepository(
              apiService: ApiService(),
              databaseServices: LocalDatabaserService(),
            ),
          ),
        ),

        /// Detail
        ChangeNotifierProvider(
          create: (_) => RestaurantDetailProvider(
            repository: RestaurantRepository(
              apiService: ApiService(),
              databaseServices: LocalDatabaserService(),
            ),
          ),
        ),

        /// Search
        ChangeNotifierProvider(
          create: (_) => RestaurantSearchProvider(
            repository: RestaurantRepository(
              apiService: ApiService(),
              databaseServices: LocalDatabaserService(),
            ),
          ),
        ),

       
        ChangeNotifierProvider(
          create: (_) => AddReviewProvider(
            repository: RestaurantRepository(
              apiService: ApiService(),
              databaseServices: LocalDatabaserService(),
            ),
          ),
        ),

        /// Bottom Nav
        ChangeNotifierProvider(create: (_) => IndexNavProvider()),

        /// Bookmark Icon
        ChangeNotifierProvider(create: (_) => BookmarkIconProvider()),

        /// Bookmark List
        ChangeNotifierProvider(
          create: (_) => BookmarkListProvider(
            repository: RestaurantRepository(
              apiService: ApiService(),
              databaseServices: LocalDatabaserService(),
            ),
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
      title: 'Dicoding Restaurant Apps',
      theme: RestaurantsTheme.lightTheme,
      darkTheme: RestaurantsTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (_) => const MainScreen(),
        NavigationRoute.detailRoute.name: (context) =>
            RestaurantDetailPage(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        NavigationRoute.searchRoute.name: (_) =>
            const RestaurantSearchPage(),
        NavigationRoute.settingRoute.name: (_) =>
            const SettingsPage(),
      },
    );
  }
}

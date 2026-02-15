import 'package:resto_app_dicoding/data/api/api_service.dart';
import 'package:resto_app_dicoding/data/local/local_databaser_service.dart';
import 'package:resto_app_dicoding/data/repositories/restaurant_repository.dart';
import 'package:resto_app_dicoding/services/local_notification_services.dart';

class BackgroundService {
  static Future<void> runDailyTask() async {
    final notificationService = LocalNotificationService();
    await notificationService.init();

    final repository = RestaurantRepository(
      apiService: ApiService(),
      databaseServices: LocalDatabaserService(),
    );

    try {
      final restaurants = await repository.getRestaurantList();

      if (restaurants.isNotEmpty) {
        restaurants.shuffle();
        final random = restaurants.first;

        await notificationService.showInstantNotification(
          title: "Rekomendasi Hari Ini 🍽️",
          body: "${random.name} ⭐ ${random.rating}",
        );
      }
    } catch (_) {
      // optionally log
    }
  }
}
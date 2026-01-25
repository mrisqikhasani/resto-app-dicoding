import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';

class RestaurantListResponse {
  final bool error;
  final String message;
  final int count;
  final List<RestaurantItem> restaurants;

  RestaurantListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantListResponse(
      error: json['error'],
      message: json['message'],
      count: json['count'],
      restaurants: (json['restaurants'] as List?)
          ?.map((e) => RestaurantItem.fromJson(e))
          .toList() ?? <RestaurantItem>[],
    );
  }
}

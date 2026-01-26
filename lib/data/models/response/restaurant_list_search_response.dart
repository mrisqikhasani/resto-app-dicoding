import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';

class RestaurantListSearchResponse {
  final bool error;
  final int founded;
  final List<RestaurantItem> restaurants;

  RestaurantListSearchResponse({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory RestaurantListSearchResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantListSearchResponse(
      error: json['error'],
      founded: json['founded'],
      restaurants:
          (json['restaurants'] as List?)
              ?.map((e) => RestaurantItem.fromJson(e))
              .toList() ??
          <RestaurantItem>[],
    );
  }
}

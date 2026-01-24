import 'package:resto_app_dicoding/data/models/restaurant_detail_model.dart';

class RestaurantDetailResponse {
  final bool error;
  final String message;
  final RestaurantsDetail restaurant;

  RestaurantDetailResponse({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailResponse(
      error: json['error'],
      message: json['message'],
      restaurant: json['restaurant'],
    );
  }
}

import 'package:resto_app_dicoding/data/models/review_model.dart';

class ReviewRestaurantResponse {
  final bool error;
  final String message;
  final List<Review> customerReviews;

  ReviewRestaurantResponse({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  factory ReviewRestaurantResponse.fromJson(Map<String, dynamic> json) {
    return ReviewRestaurantResponse(
      error: json['error'],
      message: json['message'],
      customerReviews: (json['customerReviews'] as List)
          .map((e) => Review.fromJson(e))
          .toList(),
    );
  }
}

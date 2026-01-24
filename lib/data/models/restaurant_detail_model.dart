import 'package:resto_app_dicoding/data/models/category_model.dart';
import 'package:resto_app_dicoding/data/models/menus_model.dart';
import 'package:resto_app_dicoding/data/models/review_model.dart';

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String address;
  final double rating;
  final List<Category> categories;
  final Menus menus;
  final List<Review> customerReviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.address,
    required this.rating,
    required this.categories,
    required this.menus,
    required this.customerReviews,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    return RestaurantDetail(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      address: json['address'],
      rating: (json['rating'] as num).toDouble(),
      categories: (json['categories'] as List)
          .map((e) => Category.fromJson(e))
          .toList(),
      menus: Menus.fromJson(json['menus']),
      customerReviews: (json['customerReviews'] as List)
          .map((e) => Review.fromJson(e))
          .toList(),
    );
  }
}

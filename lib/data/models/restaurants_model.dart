import 'package:resto_app_dicoding/data/models/category_model.dart';
import 'package:resto_app_dicoding/data/models/menus_model.dart';
import 'package:resto_app_dicoding/data/models/review_model.dart';

class Restaurants {
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


  Restaurants({
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
}
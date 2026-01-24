import 'package:resto_app_dicoding/data/models/drink_model.dart';
import 'package:resto_app_dicoding/data/models/food_model.dart';

class Menus {
  final List<Food> foods;
  final List<Drink> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      foods: (json['foods'] as List)
          .map((element) => Food.fromJson(element))
          .toList(),
      drinks: (json['drinks'] as List)
          .map((element) => Drink.fromJson(element))
          .toList(),
    );
  }
}

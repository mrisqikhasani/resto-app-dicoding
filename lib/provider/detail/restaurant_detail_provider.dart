import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/core/state/result_state.dart';
import 'package:resto_app_dicoding/data/models/restaurant_detail_model.dart';
import 'package:resto_app_dicoding/data/repositories/restaurant_repository.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final RestaurantRepository repository;
  final String restaurantdId;

  RestaurantDetailProvider({
    required this.repository,
    required this.restaurantdId,
  });

  ResultState _state = ResultState.initial;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;
  
  RestaurantDetail? _restaurant;
  RestaurantDetail? get restaurant => _restaurant;

  Future<void> fetchRestaurantDetail() async {
    try {
      
    } on Failure catch (e) {
        _state = ResultState.error;
        _message = e.message;
    } finally {
      notifyListeners();
    }
  }
}

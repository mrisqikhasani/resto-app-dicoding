import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/core/state/result_state.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:resto_app_dicoding/data/repositories/restaurant_repository.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  final RestaurantRepository repository;

  RestaurantSearchProvider({required this.repository});

  ResultState _state = ResultState.initial;
  ResultState get state => _state;

  List<RestaurantItem> _result = [];
  List<RestaurantItem> get results => _result;

  String _messsage = '';
  String get message => _messsage;

  Future<void> searchRestaurant(String query) async {
    if(query.isEmpty){
      _state = ResultState.initial;
      _result = [];
      notifyListeners();
      return;
    }

    try {
      _state = ResultState.loading;
      notifyListeners();

      _result = await repository.searchRestaurant(query);
      _state = ResultState.success;
    } catch (e) {
      _state = ResultState.error;
      _messsage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
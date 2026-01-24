import 'package:flutter/widgets.dart';
import 'package:resto_app_dicoding/core/state/result_state.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:resto_app_dicoding/data/repositories/restaurant_repository.dart';

class RestaurantListProvider extends ChangeNotifier {
  final RestaurantRepository repository;

  RestaurantListProvider({required this.repository}) {
    fetchRestaurantList();
  }

  ResultState _state = ResultState.initial;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<RestaurantItem> _restaurants = [];
  List<RestaurantItem> get restaurants => _restaurants;

  Future<void> fetchRestaurantList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      _restaurants = await repository.getRestaurantList();
      _state = ResultState.success;
    } on Failure catch (e) {
      _state = ResultState.error;
      _message = e.message;
    } finally {
      notifyListeners();
    }
  }

  Future<void> searchRestaurant(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      _restaurants = await repository.searchRestaurant(query);
      _state = ResultState.success;
    } on Failure catch (e) {
      _state = ResultState.error;
      _message = e.message;
    } finally {
      notifyListeners();
    }
  }
}

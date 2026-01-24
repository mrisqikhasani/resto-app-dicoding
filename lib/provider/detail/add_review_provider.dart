import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/core/state/result_state.dart';
import 'package:resto_app_dicoding/data/models/review_model.dart';
import 'package:resto_app_dicoding/data/repositories/restaurant_repository.dart';

class AddReviewProvider extends ChangeNotifier {
  final RestaurantRepository repository;

  AddReviewProvider({required this.repository});

  ResultState _state = ResultState.initial;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<Review> _reviews = [];
  List<Review> get reviews => _reviews;

  Future<void> submitReview({
    required String restaurantId,
    required String name,
    required String review,
  }) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      _reviews = await repository.addReview(
        restaurantId: restaurantId,
        name: name,
        review: review,
      );

      _state = ResultState.success;
    } on Failure catch (e) {
      _state = ResultState.error;
      _message = e.message;
    } finally {
      notifyListeners();
    }
  }

  void reset() {
    _state = ResultState.initial;
    _message = '';
    notifyListeners();
  }
}
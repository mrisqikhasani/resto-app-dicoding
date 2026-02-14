import 'package:flutter/widgets.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';

class BookmarkListProvider extends ChangeNotifier {
  final List<RestaurantItem> _bookmarkList = [];

  List<RestaurantItem> get bookmarkList => List.unmodifiable(_bookmarkList);

  void addBookmark(RestaurantItem restaurant) {
    if (!isBookmarked(restaurant.id)) {
      _bookmarkList.add(restaurant);
      notifyListeners();
    }
  }

  void removeBookmark(String id) {
    _bookmarkList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  bool isBookmarked(String id) {
    return _bookmarkList.any((element) => element.id == id);
  }

  void toggleBookmark(RestaurantItem restaurant) {
    if (isBookmarked(restaurant.id)) {
      removeBookmark(restaurant.id);
    } else {
      addBookmark(restaurant);
    }
  }
}

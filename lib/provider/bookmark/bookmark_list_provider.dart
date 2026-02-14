import 'package:flutter/widgets.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:resto_app_dicoding/data/repositories/restaurant_repository.dart';

class BookmarkListProvider extends ChangeNotifier {
  final RestaurantRepository repository;

  BookmarkListProvider({required this.repository});

  List<RestaurantItem> _bookmarkList = [];
  List<RestaurantItem> get bookmarkList => _bookmarkList;

  Future<void> loadBookmark() async {
    _bookmarkList = await repository.getBookmarkedRestaurants();
    notifyListeners();
  }

  Future<void> toogleBookmarks(RestaurantItem restaurant) async {
    final isBookmarked = await repository.isBookmarked(restaurant.id);

    if(isBookmarked) {
      await repository.removeBookmark(restaurant.id);
    } else {
      await repository.saveBookmark(restaurant);
    }

  await loadBookmark();
  }
}

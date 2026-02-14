import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:resto_app_dicoding/provider/bookmark/bookmark_list_provider.dart';

class BookmartIconWidget extends StatelessWidget {
  final RestaurantItem restaurant;

  const BookmartIconWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = context.watch<BookmarkListProvider>();
    final isBookmarked = bookmarkProvider.isBookmarked(restaurant.id);

    return IconButton(
      onPressed: () {
        bookmarkProvider.toggleBookmark(restaurant);
      },
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
      ),
    );
  }
}

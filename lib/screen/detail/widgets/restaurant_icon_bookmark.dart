import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:resto_app_dicoding/provider/bookmark/bookmark_list_provider.dart';

class BookmartIconWidget extends StatelessWidget {
  final RestaurantItem restaurant;

  const BookmartIconWidget({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = context.watch<BookmarkListProvider>();

    return FutureBuilder<bool>(
      future: bookmarkProvider.repository.isBookmarked(restaurant.id),
      builder: (context, snapshot) {
        final isBookmarked = snapshot.data ?? false;

        return IconButton(
          icon: Icon(
            isBookmarked ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () async {
            await bookmarkProvider.toogleBookmarks(restaurant);
          },
        );
      },
    );
  }
}

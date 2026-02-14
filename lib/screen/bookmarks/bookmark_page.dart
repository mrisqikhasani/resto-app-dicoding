import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/core/navigation/navigation_route.dart';
import 'package:resto_app_dicoding/provider/bookmark/bookmark_list_provider.dart';
import 'package:resto_app_dicoding/screen/home/widgets/restaurant_card.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boomark List')),
      body: Consumer<BookmarkListProvider>(
        builder: (context, value, child) {
          final bookmartList = value.bookmarkList;

          return switch (bookmartList.isNotEmpty) {
            true => ListView.builder(
              itemCount: bookmartList.length,
              itemBuilder: (context, index) {
                final restaurant = bookmartList[index];
                return RestaurantCard(
                  restaurant: restaurant,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NavigationRoute.detailRoute.name,
                      arguments: bookmartList[index].id,
                    );
                    // setState(() {});
                  },
                );
              },
            ),

            _ => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("No Bookmarked")],
              ),
            ),
          };
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/provider/main/index_nav_provider.dart';
import 'package:resto_app_dicoding/screen/bookmarks/bookmark_page.dart';
import 'package:resto_app_dicoding/screen/home/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return switch (value.indexBottomNav) {
            1 => const BookmarkPage(),
            _ => const HomePage(),
          };
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<IndexNavProvider>().indexBottomNav,
        onTap: (index) {
          context.read<IndexNavProvider>().setIndexBottomNav = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Restaurant',
            tooltip: 'Restaurant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
            tooltip: 'Bookmarks',
          ),
        ],
      ),
    );
  }
}

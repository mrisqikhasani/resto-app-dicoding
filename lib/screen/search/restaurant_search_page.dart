import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/screen/search/widget/search_result_list.dart';
import 'package:resto_app_dicoding/screen/search/widget/search_text_field_widget.dart';

class RestaurantSearchPage extends StatelessWidget {
  const RestaurantSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Restaurant'),
      ),
      body: Column(
        children: const [
          SearchTextFieldWidget(),
          Expanded(child: SearchResultList()),
        ],
      ),
    );
  }
}

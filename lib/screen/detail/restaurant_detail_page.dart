import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/core/state/result_state.dart';
import 'package:resto_app_dicoding/provider/detail/restaurant_detail_provider.dart';
import 'package:resto_app_dicoding/screen/detail/widgets/restaurant_description_section.dart';
import 'package:resto_app_dicoding/screen/detail/widgets/restaurant_info_section.dart';
import 'package:resto_app_dicoding/screen/widgets/error_state_widget.dart';
import 'package:resto_app_dicoding/style/restaurant_color.dart';
import 'package:resto_app_dicoding/style/typography/restaurant_text_style.dart';
import 'package:resto_app_dicoding/utils/image_helper.dart';

class RestaurantDetailPage extends StatefulWidget {
  final String restaurantId;

  const RestaurantDetailPage({super.key, required this.restaurantId});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<RestaurantDetailProvider>().fetchRestaurantDetail(
        widget.restaurantId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RestaurantDetailProvider>(
        builder: (context, value, child) {
          switch (value.state) {
            case ResultState.loading:
              return const Center(child: CircularProgressIndicator());
            case ResultState.error:
              return ErrorStateWidget(
                message: value.message,
                onRetry: () => value.fetchRestaurantDetail(widget.restaurantId),
              );
            case ResultState.success:
              final restaurant = value.restaurant;
              return CustomScrollView(
                slivers: [
                  /// APP BAR IMAGE
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 260,
                    backgroundColor: RestaurantColor.primary,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        restaurant!.name,
                        style: RestaurantTextStyle.titleMedium.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      background: Hero(
                        tag: restaurant.pictureId,
                        child: Image.network(
                          ImageHelper.large(restaurant.pictureId),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  /// CONTENT
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RestaurantInfoSection(restaurant: restaurant),
                          const SizedBox(height: 16),
                          RestaurantDescriptionSection(restaurant: restaurant),
                          const SizedBox(height: 24),
                          // _MenuSection(
                          //   foods: restaurant.menus.foods,
                          //   drinks: restaurant.menus.drinks,
                          // ),
                          const SizedBox(height: 24),
                          // _ReviewSection(
                          //   reviews: restaurant.customerReviews,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

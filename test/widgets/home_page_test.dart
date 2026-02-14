import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resto_app_dicoding/core/navigation/navigation_route.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:resto_app_dicoding/screen/home/widgets/restaurant_card.dart';
import 'package:resto_app_dicoding/screen/home/widgets/restaurant_list_view.dart';

void main() {
  // Mock Data
  final mockRestaurants = [
    RestaurantItem(
      id: "1",
      name: "Melting Pot",
      description: "Lorem ipsum",
      pictureId: "14",
      city: "Medan",
      rating: 4.2,
    ),
    RestaurantItem(
      id: "2",
      name: "Kafe Kita",
      description: "Lorem ipsum",
      pictureId: "15",
      city: "Gorontalo",
      rating: 4.0,
    ),
  ];

  group('RestaurantListView Widget Tests', () {
    
    testWidgets('Harus menampilkan pesan kosong ketika list restoran kosong',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RestaurantListView(restaurants: []),
          ),
        ),
      );

      expect(find.text('Restoran tidak ditemukan'), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('Harus menampilkan jumlah RestaurantCard yang sesuai dengan data',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RestaurantListView(restaurants: mockRestaurants),
          ),
        ),
      );

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(RestaurantCard), findsNWidgets(mockRestaurants.length));
      expect(find.text('Melting Pot'), findsOneWidget);
    });

    testWidgets('Harus memicu navigasi saat RestaurantCard di-tap',
        (WidgetTester tester) async {      
      String? targetedRoute;
      Object? passedArguments;

      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: (settings) {
            if (settings.name == NavigationRoute.detailRoute.name) {
              targetedRoute = settings.name;
              passedArguments = settings.arguments;
            }
            return MaterialPageRoute(builder: (_) => const Scaffold());
          },
          home: Scaffold(
            body: RestaurantListView(restaurants: [mockRestaurants[0]]),
          ),
        ),
      );

      final restaurantCard = find.byType(RestaurantCard);
      await tester.tap(restaurantCard);
      
      await tester.pumpAndSettle();

      expect(targetedRoute, NavigationRoute.detailRoute.name);
      expect(passedArguments, mockRestaurants[0].id);
    });
  });
}
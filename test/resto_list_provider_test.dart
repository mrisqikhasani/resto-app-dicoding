import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:resto_app_dicoding/core/state/result_state.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:resto_app_dicoding/data/repositories/restaurant_repository.dart';
import 'package:resto_app_dicoding/provider/home/restaurant_list_provider.dart';

import 'resto_list_provider_test.mocks.dart';

Future<void> pump() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
}

@GenerateMocks([RestaurantRepository])
void main() {
  group('RestaurantListProvider', () {
    late MockRestaurantRepository mockRepository;

    setUp(() {
      mockRepository = MockRestaurantRepository();
    });

    // Test 1: Memastikan state awal provider harus didefinisikan
    test(
      'Memastikan state awal provider harus didefinisikan',
      () async {
        // Arrange: Mock empty list untuk constructor call
        when(mockRepository.getRestaurantList()).thenAnswer((_) async => []);
        
        // Act: Buat provider baru
        final provider = RestaurantListProvider(repository: mockRepository);
        
        // Wait untuk async completion
        await pump();
        
        // Assert: Setelah constructor selesai, state harus success dengan data kosong
        // (karena fetchRestaurantList() dipanggil di constructor)
        expect(provider.state, ResultState.success);
        expect(provider.restaurants, isEmpty);
        expect(provider.message, isEmpty);
      },
    );

    // Test 2: Memastikan harus mengembalikan daftar restoran ketika pengambilan data API berhasil
    test(
      'Memastikan harus mengembalikan daftar restoran ketika pengambilan data API berhasil',
      () async {
        // Arrange
        final mockRestaurants = [
          RestaurantItem(
            id: '1',
            name: 'Restoran A',
            description: 'Deskripsi A',
            pictureId: 'pic1',
            city: 'Jakarta',
            rating: 4.5,
          ),
          RestaurantItem(
            id: '2',
            name: 'Restoran B',
            description: 'Deskripsi B',
            pictureId: 'pic2',
            city: 'Bandung',
            rating: 4.8,
          ),
        ];

        when(mockRepository.getRestaurantList())
            .thenAnswer((_) async => mockRestaurants);
        
        final provider = RestaurantListProvider(repository: mockRepository);
        
        // Wait untuk async completion
        await pump();

        // Assert
        expect(provider.state, ResultState.success);
        expect(provider.restaurants, equals(mockRestaurants));
        expect(provider.restaurants.length, 2);
        expect(provider.restaurants[0].name, 'Restoran A');
        expect(provider.restaurants[1].name, 'Restoran B');
        expect(provider.message, isEmpty);
      },
    );

    // Test 3: Memastikan harus mengembalikan kesalahan ketika pengambilan data API gagal
    test(
      'Memastikan harus mengembalikan kesalahan ketika pengambilan data API gagal',
      () async {
        // Arrange
        const errorMessage = 'Tidak ada koneksi internet';
        when(mockRepository.getRestaurantList())
            .thenThrow(Failure(errorMessage));

        // Act
        final provider = RestaurantListProvider(repository: mockRepository);
        
        // Wait untuk async completion
        await pump();

        // Assert
        expect(provider.state, ResultState.error);
        expect(provider.message, errorMessage);
        expect(provider.restaurants, isEmpty);
      },
    );
  });
}

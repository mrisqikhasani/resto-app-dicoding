import 'dart:io';
import 'package:resto_app_dicoding/data/api/api_service.dart';
import 'package:resto_app_dicoding/data/local/local_databaser_service.dart';
import 'package:resto_app_dicoding/data/models/restaurant_detail_model.dart';
import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:resto_app_dicoding/data/models/review_model.dart';

class Failure implements Exception {
  final String message;
  Failure(this.message);
}

class RestaurantRepository {
  final ApiService apiService;
  final LocalDatabaserService databaseServices;

  RestaurantRepository({
    required this.apiService,
    required this.databaseServices,
  });

  Future<List<RestaurantItem>> getRestaurantList() async {
    try {
      final response = await apiService.getRestaurantList();
      return response.restaurants;
    } on SocketException {
      throw Failure('Tidak ada koneksi internet');
    } on ApiException catch (e) {
      if (e.statusCode == 404) {
        throw Failure('Data restoran tidak ditemukan');
      }
      throw Failure('Terjadi kesalahan pada server');
    } catch (_) {
      throw Failure('Terjadi kesalahan tidak terduga');
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    try {
      final response = await apiService.getRestaurantDetail(id);
      return response.restaurant;
    } on SocketException {
      throw Failure('Tidak ada koneksi internet');
    } on ApiException catch (e) {
      if (e.statusCode == 404) {
        throw Failure('Detail restoran tidak ditemukan');
      }
      throw Failure('Terjadi kesalahan pada server');
    } catch (_) {
      throw Failure('Terjadi kesalahan tidak terduga');
    }
  }

  Future<List<RestaurantItem>> searchRestaurant(String query) async {
    try {
      final response = await apiService.searchRestaurant(query);
      return response.restaurants;
    } on SocketException {
      throw Failure('Tidak ada koneksi internet');
    } on ApiException {
      throw Failure('Gagal mencari restoran');
    } catch (_) {
      throw Failure('Terjadi kesalahan tidak terduga');
    }
  }

  Future<List<Review>> addReview({
    required String restaurantId,
    required String name,
    required String review,
  }) async {
    try {
      final response = await apiService.addReview(
        id: restaurantId,
        name: name,
        review: review,
      );

      return response.customerReviews;
    } on SocketException {
      throw Failure('Tidak ada koneksi internet');
    } on ApiException catch (e) {
      if (e.statusCode == 400) {
        throw Failure('Review tidak valid');
      }
      throw Failure('Gagal mengirim review');
    } catch (_) {
      throw Failure('Terjadi kesalahan tidak terduga');
    }
  }

  // Bookmark section

  Future<void> saveBookmark(RestaurantItem restaurant) async {
    try {
      await databaseServices.insertBookmark(restaurant);
    } catch (_) {
      throw Failure('Gagal menyimpan bookmark');
    }
  }

  Future<void> removeBookmark(String id) async {
    try {
      await databaseServices.removeBookmark(id);
    } catch (_) {
      throw Failure('Gagal menghapus bookmark');
    }
  }

  Future<List<RestaurantItem>> getBookmarkedRestaurants() async {
    try {
      final result = await databaseServices.getAllBookmarks();
      return result;
    } catch (_) {
      throw Failure('Gagal mengambil daftar bookmark');
    }
  }

  Future<bool> isBookmarked(String id) async {
    try {
      final result = await databaseServices.getBookmarkbyId(id);
      return result != null;
    } catch (_) {
      throw Failure('Gagal mengecek status bookmark');
    }
  }
}

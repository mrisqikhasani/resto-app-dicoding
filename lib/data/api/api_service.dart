import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resto_app_dicoding/data/models/response/restaurant_detail_response.dart';
import 'package:resto_app_dicoding/data/models/response/restaurant_list_response.dart';
import 'package:resto_app_dicoding/data/models/response/review_restaurant_response.dart';

class ApiService {
  static const String _baseUrl =
      'https://restaurant-api.dicoding.dev';

  final http.Client client;

  ApiService({http.Client? client})
      : client = client ?? http.Client();

  // GET: Restaurant List
  Future<RestaurantListResponse> getRestaurantList() async {
    final response = await _get('/list');

    return RestaurantListResponse.fromJson(
      jsonDecode(response.body),
    );
  }

  /// GET: Restaurant Detail
  Future<RestaurantDetailResponse> getRestaurantDetailById(String id) async {
    final response = await _get('/detail/$id');

    return RestaurantDetailResponse.fromJson(
      jsonDecode(response.body),
    );
  }

  /// GET: Search Restaurant
  Future<RestaurantListResponse> searchRestaurantByQuery(String query) async {
    final response = await _get('/search?q=$query');

    return RestaurantListResponse.fromJson(
      jsonDecode(response.body),
    );
  }

  /// POST: Add Review
  Future<ReviewRestaurantResponse> addReview({
    required String id,
    required String name,
    required String review,
  }) async {
    final response = await _post(
      '/review',
      body: {
        'id': id,
        'name': name,
        'review': review,
      },
    );

    return ReviewRestaurantResponse.fromJson(
      jsonDecode(response.body),
    );
  }



  Future<http.Response> _get(String path) async {
    final response = await client
        .get(Uri.parse('$_baseUrl$path'))
        .timeout(const Duration(seconds: 10));

    _validateResponse(response);
    return response;
  }

  Future<http.Response> _post(
    String path, {
    required Map<String, dynamic> body,
  }) async {
    final response = await client
        .post(
          Uri.parse('$_baseUrl$path'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 10));

    _validateResponse(response);
    return response;
  }

  void _validateResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        'Request failed: ${response.statusCode}',
      );
    }
  }
}

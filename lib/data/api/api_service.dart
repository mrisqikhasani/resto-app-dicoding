import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resto_app_dicoding/data/models/response/restaurant_detail_response.dart';
import 'package:resto_app_dicoding/data/models/response/restaurant_list_response.dart';
import 'package:resto_app_dicoding/data/models/response/restaurant_list_search_response.dart';
import 'package:resto_app_dicoding/data/models/response/review_restaurant_response.dart';

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);
}

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';
  final http.Client client;

  ApiService({http.Client? client}) : client = client ?? http.Client();

  Future<RestaurantListResponse> getRestaurantList() async {
    final response = await client.get(Uri.parse('$_baseUrl/list'));
    _validateResponse(response);
    return RestaurantListResponse.fromJson(jsonDecode(response.body));
  }

  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    final response = await client.get(Uri.parse('$_baseUrl/detail/$id'));
    _validateResponse(response);
    return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
  }

  Future<RestaurantListSearchResponse> searchRestaurant(String query) async {
    final response = await client.get(Uri.parse('$_baseUrl/search?q=$query'));
    _validateResponse(response);
    return RestaurantListSearchResponse.fromJson(jsonDecode(response.body));
  }

  Future<ReviewRestaurantResponse> addReview({
    required String id,
    required String name,
    required String review,
  }) async {
    final response = await client.post(
      Uri.parse('$_baseUrl/review'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': id, 'name': name, 'review': review}),
    );

    _validateResponse(response);
    return ReviewRestaurantResponse.fromJson(jsonDecode(response.body));
  }

  void _validateResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) return;

    final body = jsonDecode(response.body);
    throw ApiException(response.statusCode, body['message'] ?? 'Unknown error');
  }
}

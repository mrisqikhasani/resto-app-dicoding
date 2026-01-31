class ImageHelper {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/images';

  static String small(String pictureId) {
    return '$_baseUrl/small/$pictureId';
  }

  static String medium(String pictureId) {
    return '$_baseUrl/medium/$pictureId';
  }

  static String large(String pictureId) {
    return '$_baseUrl/large/$pictureId';
  }
}

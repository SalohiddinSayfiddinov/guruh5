class Api {
  Api._();

  /// URL
  static const String baseUrl = "https://fastapi-books-app.onrender.com";

  /// ENDPOINTS
  // auth
  static const String signUp = "$baseUrl/auth/signup";
  static const String verify = "$baseUrl/auth/verify";
  static const String login = "$baseUrl/auth/login";

  // home
  static const String books = "/books";
  static const String vendors = "$baseUrl/vendors";
  static const String vendorCategories = "$baseUrl/vendor-categories";

  // profile
  static const String profile = "/auth/profile";

  /// HEADERS
  static const Map<String, String> getHeader = {
    'Content-Type': 'application/json',
  };
  static const Map<String, String> postHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

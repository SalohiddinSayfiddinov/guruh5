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
  static const String books = "$baseUrl/books";

  /// HEADERS
  static const Map<String, String> getHeader = {
    'Content-Type': 'application/json',
  };
  static const Map<String, String> postHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

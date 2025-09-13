class Api {
  Api._();

  /// URL
  static const String baseUrl = "https://fastapi-books-app.onrender.com";

  /// ENDPOINTS
  // auth
  static const String signUp = "$baseUrl/auth/signup";
  static const String verify = "$baseUrl/auth/verify";
}

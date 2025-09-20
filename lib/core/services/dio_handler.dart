import 'package:dio/dio.dart';
import 'package:guruh5/core/api/api.dart';

class DioClient {
  // Private constructor
  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {"Content-Type": "application/json"},
      ),
    );

    // Example: add an interceptor
    // _dio.interceptors.add(
    //   LogInterceptor(request: true, responseBody: true, requestBody: true),
    // );
  }

  late final Dio _dio;

  // Singleton instance
  static final DioClient _instance = DioClient._internal();

  // Getter to access Dio
  static Dio get dio => _instance._dio;
}

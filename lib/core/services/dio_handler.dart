// import 'package:dio/dio.dart';
// import 'package:guruh5/core/api/api.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DioClient {
//   // Private constructor
//   DioClient._internal() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: Api.baseUrl,
//         connectTimeout: const Duration(seconds: 60),
//         receiveTimeout: const Duration(seconds: 60),
//         headers: {"Content-Type": "application/json"},
//       ),
//     );

//     // Example: add an interceptor
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           final SharedPreferences prefs = await SharedPreferences.getInstance();
//           final String? token = prefs.getString('token');
//           if (token != null) {
//             options.headers['Authorization'] = 'Bearer $token';
//           }
//           return handler.next(options);
//         },
//         onResponse: (response, handler) {
//           return handler.next(response);
//         },
//       ),
//       // LogInterceptor(request: true, responseBody: true, requestBody: true),
//     );
//   }

//   late final Dio _dio;

//   // Singleton instance
//   static final DioClient _instance = DioClient._internal();

//   // Getter to access Dio
//   static Dio get dio => _instance._dio;
// }

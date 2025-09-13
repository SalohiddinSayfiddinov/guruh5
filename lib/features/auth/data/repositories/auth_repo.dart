import 'dart:convert';

import 'package:guruh5/core/api/api.dart';
import 'package:guruh5/core/services/error_handler.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  Future<String> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(Api.signUp),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "password": password, "name": name}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['msg'];
      }
      throw parseDjangoError(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> verify({required String email, required String otp}) async {
    try {
      final response = await http.post(
        Uri.parse(Api.verify),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "otp": otp}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['msg'];
      }
      throw parseDjangoError(data);
    } catch (e) {
      rethrow;
    }
  }
}

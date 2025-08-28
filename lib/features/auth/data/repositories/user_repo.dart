import 'dart:convert';

import 'package:guruh5/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(
        Uri.parse("https://68a9cff5b115e67576ec277d.mockapi.io/users"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List data = jsonDecode(response.body);
        return data.map((e) => User.fromJson(e)).toList();
      }
      throw Exception('Failed to login');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse("https://68a9cff5b115e67576ec277d.mockapi.io/users"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to login');
      }
    } catch (e) {
      rethrow;
    }
  }
}

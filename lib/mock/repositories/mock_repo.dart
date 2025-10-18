import 'dart:convert';

import 'package:http/http.dart' as http;

class MockRepository {
  Future<List> getPosts() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    List data = jsonDecode(response.body);
    return data;
  }
}

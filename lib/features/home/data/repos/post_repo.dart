import 'dart:convert';

import 'package:guruh5/features/home/data/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Post> createPost(Post post) async {
    try {
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(post.toJson()),
      );
      if (response.statusCode != 201 || response.statusCode != 200) {
        return Post.fromJson(jsonDecode(response.body));
      }
      throw Exception('Failed to create post');
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:convert';

import 'package:guruh5/features/home/data/models/post_model.dart';
import 'package:http/http.dart' as http;

class MockRepository {
  Future<List<Post>> getPosts() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    List data = jsonDecode(response.body);
    final List<Post> posts = [];
    for (var post in data) {
      posts.add(
        Post(
          id: post['id'],
          userId: post['userId'],
          title: post['title'],
          body: post['body'],
        ),
      );
    }
    return posts;
  }
}

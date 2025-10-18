import 'package:flutter/material.dart';

class PostDetailsPage extends StatelessWidget {
  final Map<String, dynamic> post;
  const PostDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(post['id'].toString()),
            Text(post['title']),
            Text(post['body']),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:guruh5/features/home/data/models/post_model.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;
  const PostDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(post.id.toString()),
            Text(post.title),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:guruh5/features/home/data/models/post_model.dart';
import 'package:guruh5/features/home/data/repos/post_repo.dart';

class PostProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  Post? result;

  bool isGetting = false;
  List<Post>? posts;
  String? getPostsErrorMessage;

  Future<void> createPost(Post post) async {
    isLoading = true;
    errorMessage = null;
    result = null;
    notifyListeners();
    try {
      result = await PostRepo().createPost(post);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPosts() async {
    isGetting = true;
    getPostsErrorMessage = null;
    posts = null;
    notifyListeners();
    try {
      posts = await PostRepo().getPosts();
    } catch (e) {
      getPostsErrorMessage = e.toString();
    } finally {
      isGetting = false;
      notifyListeners();
    }
  }
}

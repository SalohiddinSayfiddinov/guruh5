import 'package:guruh5/features/home/data/models/post_model.dart';

class PostState {
  final bool isLoading;
  final String? error;
  final List<Post> posts;

  const PostState({this.isLoading = false, this.error, this.posts = const []});

  PostState copyWith({bool? isLoading, String? error, List<Post>? posts}) {
    return PostState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      posts: posts ?? this.posts,
    );
  }
}

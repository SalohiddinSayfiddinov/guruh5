import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/home/data/repos/post_repo.dart';
import 'package:guruh5/features/home/presentation/cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostState());

  Future<void> getPosts() async {
    emit(state.copyWith(isLoading: true));
    try {
      final posts = await PostRepo().getPosts();
      emit(state.copyWith(isLoading: false, posts: posts));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}

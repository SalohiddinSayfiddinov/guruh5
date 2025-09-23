import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/core/error/failure.dart';
import 'package:guruh5/features/home/data/models/book_model.dart';
import 'package:guruh5/features/home/domain/repositories/books_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(HomeInit());
  final BooksRepo _repo;

  Future<void> getBooks() async {
    emit(HomeLoading());
    final Either<Failure, List<BookModel>> result = await _repo.getBooks();
    result.fold(
      (failure) => emit(HomeError(error: failure.message)),
      (books) => emit(HomeSuccess(books: books)),
    );
  }
}

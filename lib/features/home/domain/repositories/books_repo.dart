import 'package:dartz/dartz.dart';
import 'package:guruh5/core/error/failure.dart';
import 'package:guruh5/features/home/data/models/book_model.dart';

abstract class BooksRepo {
  const BooksRepo();
  Future<Either<Failure, List<BookModel>>> getBooks();
}

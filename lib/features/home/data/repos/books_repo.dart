import 'package:dartz/dartz.dart';
import 'package:guruh5/core/error/exception.dart';
import 'package:guruh5/core/error/failure.dart';
import 'package:guruh5/features/home/data/datasources/books_remote_data_source.dart';
import 'package:guruh5/features/home/data/models/book_model.dart';

class BooksRepo {
  const BooksRepo(this._dataSource);
  final BooksRemoteDataSource _dataSource;

  Future<Either<Failure, List<BookModel>>> getBooks() async {
    try {
      final result = await _dataSource.getBooks();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailue(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: "Please contact devs: $e"));
    }
  }
}

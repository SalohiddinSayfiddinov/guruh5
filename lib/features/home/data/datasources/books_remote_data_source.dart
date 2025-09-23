import 'package:dio/dio.dart';
import 'package:guruh5/core/api/api.dart';
import 'package:guruh5/core/error/exception.dart';
import 'package:guruh5/core/services/error_handler.dart';
import 'package:guruh5/features/home/data/models/book_model.dart';

abstract class BooksRemoteDataSource {
  const BooksRemoteDataSource();
  Future<List<BookModel>> getBooks();
}

class BooksRemoteDataSourceImpl extends BooksRemoteDataSource {
  final Dio _dioClient;
  const BooksRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<BookModel>> getBooks() async {
    final response = await _dioClient.get(Api.books);
    if (response.statusCode == 200) {
      final List data = response.data;
      return data.map((e) => BookModel.fromJson(e)).toList();
    } else {
      final data = response.data;
      throw ServerException(parseDjangoError(data));
    }
  }
}

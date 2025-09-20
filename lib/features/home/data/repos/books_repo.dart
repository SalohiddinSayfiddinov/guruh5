import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guruh5/core/api/api.dart';
import 'package:guruh5/core/error/failure.dart';
import 'package:guruh5/core/services/error_handler.dart';
import 'package:guruh5/features/home/data/models/book_model.dart';

class BooksRepo {
  const BooksRepo(this._dioClient);
  final Dio _dioClient;

  Future<Either<Failure, List<BookModel>>> getBooks() async {
    try {
      final response = await _dioClient.get(Api.books);
      if (response.statusCode == 200) {
        final List data = response.data;
        return Right(data.map((e) => BookModel.fromJson(e)).toList());
      } else {
        final data = response.data;
        return Left(ServerFailue(message: parseDjangoError(data)));
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return Left(
          ConnectionFailure(message: 'Failed to connect to the network'),
        );
      }
      return Left(UnexpectedFailure(message: "Dio error: ${e.message}"));
    } catch (e) {
      return Left(UnexpectedFailure(message: "Please contact devs: $e"));
    }
  }
}

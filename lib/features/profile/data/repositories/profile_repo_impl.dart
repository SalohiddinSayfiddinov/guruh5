import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:guruh5/core/error/exception.dart';
import 'package:guruh5/core/error/failure.dart';
import 'package:guruh5/features/profile/data/datasources/profile_data_source.dart';
import 'package:guruh5/features/profile/domain/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  const ProfileRepoImpl(this._dataSource);
  final ProfileDataSource _dataSource;

  @override
  Future<Either<Failure, void>> uploadImage(File file) async {
    try {
      final result = await _dataSource.uploadImage(file);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailue(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: "Please contact devs: $e"));
    }
  }
}

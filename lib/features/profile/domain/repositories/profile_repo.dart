import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:guruh5/core/error/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> uploadImage(File file);
}

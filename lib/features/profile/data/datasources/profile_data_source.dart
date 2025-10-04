import 'dart:io';

import 'package:dio/dio.dart';
import 'package:guruh5/core/api/api.dart';
import 'package:guruh5/core/error/exception.dart';
import 'package:guruh5/core/services/error_handler.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileDataSource {
  Future<void> uploadImage(File file);
}

@LazySingleton(as: ProfileDataSource)
class ProfileDataSourceImpl implements ProfileDataSource {
  final Dio dio;
  ProfileDataSourceImpl(this.dio);
  @override
  Future<void> uploadImage(File file) async {
    final String format = file.path.split('.').last;
    final formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
        filename: 'user_image.$format',
      ),
      "latitude": 100,
      "longitude": 101,
    });
    final response = await dio.put(
      Api.profile,
      options: Options(headers: {"Content-Type": "multipart/form-data"}),
      data: formData,
    );
    print(response.data);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ServerException(parseDjangoError(response.data));
    }
  }
}

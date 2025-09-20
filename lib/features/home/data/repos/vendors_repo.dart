import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:guruh5/core/api/api.dart';
import 'package:guruh5/core/services/error_handler.dart';
import 'package:guruh5/features/home/data/models/vendor_category_model.dart';
import 'package:guruh5/features/home/data/models/vendor_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/failure.dart';

class VendorsRepo {
  Future<Either<Failure, List<VendorModel>>> getVendors(int categoryId) async {
    try {
      final response = await http.get(
        Uri.parse(
          Api.vendors,
        ).replace(queryParameters: {"category": categoryId.toString()}),
        headers: Api.getHeader,
      );
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        return Right(data.map((e) => VendorModel.fromJson(e)).toList());
      } else {
        final data = jsonDecode(response.body);
        return Left(ServerFailue(message: parseDjangoError(data)));
      }
    } on SocketException catch (_) {
      return Left(
        ConnectionFailure(message: 'Failed to connect to the network'),
      );
    } catch (e) {
      return Left(UnexpectedFailure(message: "Please contact to devs: $e"));
    }
  }

  Future<Either<Failure, List<VendorCategoryModel>>>
  getVendorCategories() async {
    try {
      final response = await http.get(
        Uri.parse(Api.vendorCategories),
        headers: Api.getHeader,
      );
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        return Right(data.map((e) => VendorCategoryModel.fromJson(e)).toList());
      } else {
        final data = jsonDecode(response.body);
        return Left(ServerFailue(message: parseDjangoError(data)));
      }
    } on SocketException catch (_) {
      return Left(
        ConnectionFailure(message: 'Failed to connect to the network'),
      );
    } catch (e) {
      return Left(UnexpectedFailure(message: "Please contact to devs: $e"));
    }
  }
}

/*
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class CategoriesRepository {
  final http.Client client;

  CategoriesRepository(this.client);

  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final response = await client.get(
        Uri.parse("https://fakestoreapi.com/products/categories"),
      );

      if (response.statusCode == 200) {
        final data = List<String>.from(jsonDecode(response.body));
        return Right(data);
      } else {
        return Left(ServerFailure("Server error: ${response.statusCode}"));
      }
    } on SocketException {
      return const Left(ConnectionFailure("No internet connection"));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e"));
    }
  }
}




import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<String> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError(this.message);
}

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository repository;

  CategoriesCubit(this.repository) : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());

    final Either<Failure, List<String>> result =
        await repository.getCategories();

    result.fold(
      (failure) => emit(CategoriesError(failure.message)),
      (categories) => emit(CategoriesLoaded(categories)),
    );
  }
}


BlocProvider(
  create: (context) => CategoriesCubit(CategoriesRepository(http.Client())),
  child: BlocBuilder<CategoriesCubit, CategoriesState>(
    builder: (context, state) {
      if (state is CategoriesInitial) {
        return Center(
          child: ElevatedButton(
            onPressed: () => context.read<CategoriesCubit>().fetchCategories(),
            child: Text("Load Categories"),
          ),
        );
      } else if (state is CategoriesLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is CategoriesLoaded) {
        return ListView.builder(
          itemCount: state.categories.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(state.categories[index]),
          ),
        );
      } else if (state is CategoriesError) {
        return Center(child: Text(state.message));
      }
      return const SizedBox.shrink();
    },
  ),
)


 */
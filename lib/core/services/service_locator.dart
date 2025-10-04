// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:guruh5/core/services/dio_handler.dart';
// import 'package:guruh5/features/home/data/datasources/books_remote_data_source.dart';
// import 'package:guruh5/features/home/data/repos/books_repo_implementation.dart';
// import 'package:guruh5/features/home/domain/repositories/books_repo.dart';
// import 'package:guruh5/features/home/presentation/cubit/home_cubit.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   // External
//   sl.registerLazySingleton<Dio>(() => DioClient.dio);

//   // Data Source
//   sl.registerLazySingleton<BooksRemoteDataSource>(
//     () => BooksRemoteDataSourceImpl(sl()),
//   );

//   // Repositories
//   sl.registerLazySingleton<BooksRepo>(() => BooksRepoImplementation(sl()));

//   // Cubit
//   sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
// }

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:guruh5/core/services/dio_module.dart' as _i671;
import 'package:guruh5/features/auth/presentation/cubit/auth_cubit.dart'
    as _i385;
import 'package:guruh5/features/home/data/datasources/books_remote_data_source.dart'
    as _i788;
import 'package:guruh5/features/home/data/repos/books_repo_implementation.dart'
    as _i821;
import 'package:guruh5/features/home/domain/repositories/books_repo.dart'
    as _i104;
import 'package:guruh5/features/home/presentation/cubit/home_cubit.dart'
    as _i623;
import 'package:guruh5/features/profile/data/datasources/profile_data_source.dart'
    as _i1033;
import 'package:guruh5/features/profile/data/repositories/profile_repo_impl.dart'
    as _i560;
import 'package:guruh5/features/profile/domain/repositories/profile_repo.dart'
    as _i420;
import 'package:guruh5/features/profile/presentation/cubit/profile_cubit.dart'
    as _i987;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i385.AuthCubit>(() => _i385.AuthCubit());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i1033.ProfileDataSource>(
      () => _i1033.ProfileDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i788.BooksRemoteDataSource>(
      () => _i788.BooksRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i420.ProfileRepo>(
      () => _i560.ProfileRepoImpl(gh<_i1033.ProfileDataSource>()),
    );
    gh.factory<_i987.ProfileCubit>(
      () => _i987.ProfileCubit(gh<_i420.ProfileRepo>()),
    );
    gh.lazySingleton<_i104.BooksRepo>(
      () => _i821.BooksRepoImplementation(gh<_i788.BooksRemoteDataSource>()),
    );
    gh.factory<_i623.HomeCubit>(() => _i623.HomeCubit(gh<_i104.BooksRepo>()));
    return this;
  }
}

class _$DioModule extends _i671.DioModule {}

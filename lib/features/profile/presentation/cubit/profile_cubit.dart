import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/core/error/failure.dart';
import 'package:guruh5/features/profile/domain/repositories/profile_repo.dart';
import 'package:guruh5/features/profile/presentation/cubit/profile_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repo) : super(ProfileInit());
  final ProfileRepo repo;

  Future<void> uploadImage(File file) async {
    emit(ProfileLoading());
    final Either<Failure, void> result = await repo.uploadImage(file);
    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (_) => emit(ProfileSuccess(message: 'Uploaded successfully')),
    );
  }
}

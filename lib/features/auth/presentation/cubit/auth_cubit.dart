import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/features/auth/data/repositories/auth_repo.dart';
import 'package:guruh5/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInit());

  Future<void> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final message = await AuthRepo().signUp(
        email: email,
        password: password,
        name: name,
      );

      emit(AuthSuccess(message: message));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> verify({required String email, required String otp}) async {
    // emit(state.copyWith(isLoading: true));
    // try {
    //   final message = await AuthRepo().verify(email: email, otp: otp);
    //   emit(state.copyWith(message: message, isLoading: false));
    // } catch (e) {
    //   emit(state.copyWith(error: e.toString(), isLoading: false));
    // }
  }
}

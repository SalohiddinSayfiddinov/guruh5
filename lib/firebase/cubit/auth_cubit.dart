import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/firebase/cubit/auth_state.dart';
import 'package:guruh5/firebase/data/auth_service.dart';

class FAuthCubit extends Cubit<FAuthState> {
  FAuthCubit(this._authService) : super(FAuthInit());

  final AuthService _authService;

  Future<void> signUp(String email, String password) async {
    emit(FAuthLoading());
    try {
      final user = await _authService.signUp(email, password);
      if (user == null) {
        emit(FAuthError("User not found"));
      }
      emit(FAuthSuccess(user));
    } catch (e) {
      emit(FAuthError(e.toString()));
    }
  }
}

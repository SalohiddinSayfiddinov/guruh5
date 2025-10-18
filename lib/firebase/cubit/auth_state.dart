import 'package:firebase_auth/firebase_auth.dart';

abstract class FAuthState {}

class FAuthInit extends FAuthState {}

class FAuthLoading extends FAuthState {}

class FAuthError extends FAuthState {
  final String message;
  FAuthError(this.message);
}

class FAuthSuccess extends FAuthState {
  final User? user;
  FAuthSuccess(this.user);
}

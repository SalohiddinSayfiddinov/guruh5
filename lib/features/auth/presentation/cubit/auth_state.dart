class AuthState {
  final bool isLoading;
  final String? error;
  final String? message;

  AuthState({this.isLoading = false, this.error, this.message});

  AuthState copyWith({bool? isLoading, String? error, String? message}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }
}

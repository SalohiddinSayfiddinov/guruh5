abstract class ProfileState {}

class ProfileInit extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});
}

class ProfileSuccess extends ProfileState {
  final String message;
  ProfileSuccess({required this.message});
}

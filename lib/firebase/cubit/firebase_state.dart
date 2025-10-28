import 'package:guruh5/firebase/data/models/user_model.dart';

abstract class FirebaseState {}

class FirebaseInit extends FirebaseState {}

class FirebaseLoading extends FirebaseState {}

class FirebaseError extends FirebaseState {
  final String message;
  FirebaseError(this.message);
}

class FirebaseSuccess extends FirebaseState {
  final String message;
  FirebaseSuccess(this.message);
}

class UsersLoaded extends FirebaseState {
  final List<UserModel> users;
  UsersLoaded(this.users);
}

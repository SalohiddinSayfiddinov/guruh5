// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:guruh5/core/error/exception.dart';
// import 'package:guruh5/firebase/cubit/firebase_state.dart';
// import 'package:guruh5/firebase/data/firestore_service.dart';
// import 'package:guruh5/firebase/data/models/user_model.dart';

// class FirebaseCubit extends Cubit<FirebaseState> {
//   FirebaseCubit(this._firestoreService) : super(FirebaseInit());

//   final FirestoreService _firestoreService;

//   Future<void> addUser(String email, String name) async {
//     emit(FirebaseLoading());
//     try {
//       await _firestoreService.addUser(name: name, email: email);
//       emit(FirebaseSuccess('Success'));
//     } catch (e) {
//       emit(FirebaseError(e.toString()));
//     }
//   }

//   Future<void> getUsers() async {
//     emit(FirebaseLoading());
//     try {
//       final users = await _firestoreService.getUsers();
//       emit(UsersLoaded(users));
//     } catch (e) {
//       emit(FirebaseError(e.toString()));
//     }
//   }

//   Future<void> editUser(UserModel user) async {
//     emit(FirebaseLoading());
//     try {
//       await _firestoreService.editUser(user);
//       emit(FirebaseSuccess('Success'));
//     } catch (e) {
//       if (e is ServerException) {
//         emit(FirebaseError(e.message));
//       } else {
//         emit(FirebaseError(e.toString()));
//       }
//     }
//   }

//   Future<void> deleteUser(String id) async {
//     emit(FirebaseLoading());
//     try {
//       await _firestoreService.deleteUser(id);
//       emit(FirebaseSuccess('Success'));
//     } catch (e) {
//       if (e is ServerException) {
//         emit(FirebaseError(e.message));
//       } else {
//         emit(FirebaseError(e.toString()));
//       }
//     }
//   }
// }

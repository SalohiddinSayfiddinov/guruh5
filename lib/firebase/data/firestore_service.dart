// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:guruh5/core/error/exception.dart';
// import 'package:guruh5/firebase/data/models/user_model.dart';

// class FirestoreService {
//   final CollectionReference _ref = FirebaseFirestore.instance.collection(
//     'users',
//   );

//   Future<void> addUser({required String name, required String email}) async {
//     try {
//       await _ref.add({
//         'name': name,
//         'email': email,
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       throw ServerException("Failed to add user: $e");
//     }
//   }

//   Future<List<UserModel>> getUsers() async {
//     try {
//       final snapshot = await _ref.get();
//       return snapshot.docs
//           .map(
//             (doc) =>
//                 UserModel.fromMap(doc.id, doc.data() as Map<String, dynamic>),
//           )
//           .toList();
//     } catch (e) {
//       throw ServerException("Failed to add user: $e");
//     }
//   }

//   Future<void> editUser(UserModel user) async {
//     try {
//       await _ref.doc(user.id).set(user.toMap());
//     } catch (e) {
//       throw ServerException("Failed to add user: $e");
//     }
//   }

//   Future<void> deleteUser(String id) async {
//     try {
//       await _ref.doc(id).delete();
//     } catch (e) {
//       throw ServerException("Failed to delete user: $e");
//     }
//   }
// }

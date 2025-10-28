// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:guruh5/firebase/cubit/firebase_cubit.dart';
// import 'package:guruh5/firebase/cubit/firebase_state.dart';
// import 'package:guruh5/firebase/data/models/user_model.dart';
// import 'package:guruh5/firebase/services/notification_service.dart';

// class FHomePage extends StatefulWidget {
//   const FHomePage({super.key});

//   @override
//   State<FHomePage> createState() => _FHomePageState();
// }

// class _FHomePageState extends State<FHomePage> {
//   @override
//   void initState() {
//     context.read<FirebaseCubit>().getUsers();
//     NotificationService().initialize(context);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<FirebaseCubit, FirebaseState>(
//         builder: (context, state) {
//           if (state is FirebaseLoading) {
//             return Center(child: CircularProgressIndicator.adaptive());
//           } else if (state is FirebaseError) {
//             return Center(child: Text(state.message));
//           } else if (state is UsersLoaded) {
//             final users = state.users;
//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 final user = users[index];
//                 return Card(
//                   child: ListTile(
//                     title: Text(user.name),
//                     subtitle: Text(user.id),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             final UserModel editedUser = UserModel(
//                               id: user.id,
//                               name: 'Wick',
//                               email: user.email,
//                             );
//                             context.read<FirebaseCubit>().editUser(editedUser);
//                           },
//                           icon: Icon(Icons.edit),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             context.read<FirebaseCubit>().deleteUser(user.id);
//                           },
//                           icon: Icon(Icons.delete),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//           return SizedBox.shrink();
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           print(await FirebaseMessaging.instance.getToken());
//         },
//       ),
//       // floatingActionButton: BlocConsumer<FirebaseCubit, FirebaseState>(
//       //   listener: (context, state) {
//       //     if (state is FirebaseError) {
//       //       ScaffoldMessenger.of(
//       //         context,
//       //       ).showSnackBar(SnackBar(content: Text(state.message)));
//       //     } else if (state is FirebaseSuccess) {
//       //       ScaffoldMessenger.of(
//       //         context,
//       //       ).showSnackBar(SnackBar(content: Text(state.message)));
//       //     }
//       //   },
//       //   builder: (context, state) {
//       //     final bool isLoading = state is FirebaseLoading;
//       //     return FloatingActionButton(
//       //       onPressed:
//       //           isLoading
//       //               ? null
//       //               : () {
//       //                 context.read<FirebaseCubit>().addUser(
//       //                   "test@gmail.com",
//       //                   "Mike",
//       //                 );
//       //               },
//       //       child:
//       //           isLoading
//       //               ? CircularProgressIndicator.adaptive()
//       //               : Icon(Icons.add),
//       //     );
//       //   },
//       // ),
//     );
//   }
// }

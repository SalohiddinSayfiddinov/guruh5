import 'package:flutter/material.dart';
import 'package:guruh5/features/auth/data/models/user_model.dart';
import 'package:guruh5/features/auth/data/repositories/user_repo.dart';

class UserProvider extends ChangeNotifier {
  bool isLoggingIn = false;
  String? loginError;
  String? loginSuccess;
  
  bool isGettingUsers = false;
  String? getUsersError;
  List<User>? users;

  Future<void> getUsers() async {
    isGettingUsers = true;
    getUsersError = null;
    users = null;
    notifyListeners();
    try {
      final result = await UserRepo().getUsers();
      users = result;
    } catch (e) {
      getUsersError = e.toString();
    } finally {
      isGettingUsers = false;
      notifyListeners();
    }
  }

  Future<void> login(User user) async {
    isLoggingIn = true;
    loginError = null;
    loginSuccess = null;
    notifyListeners();
    try {
      await UserRepo().createUser(user);
      loginSuccess = 'User Created';
    } catch (e) {
      loginError = e.toString();
    } finally {
      isLoggingIn = false;
      notifyListeners();
    }
  }
}

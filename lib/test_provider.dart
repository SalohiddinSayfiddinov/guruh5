import 'package:flutter/widgets.dart';

class TestProvider extends ChangeNotifier {
  int currentPage = 0;

  void changePage(int value) {
    currentPage = value;
    notifyListeners();
  }
}

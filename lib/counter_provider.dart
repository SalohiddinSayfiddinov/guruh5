import 'package:flutter/widgets.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;
  
  void increment() {
    count++;
    notifyListeners();
  }
}

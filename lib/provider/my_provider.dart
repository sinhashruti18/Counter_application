import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  int count = 1;
  int max = 10;
  int min = 1;

  void increment() {
    if (count < max) {
      count++;
      notifyListeners();
    }
  }

  void decrement() {
    if (count > min) {
      count--;
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String mainCopy = '飲んだビールを忘れるな';

  void changeCopyText() {
    mainCopy = '飲んだビールを忘れるなあ';
    notifyListeners();
  }
}
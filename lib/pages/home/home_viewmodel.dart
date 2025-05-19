import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  String _title = "";
  String _userInfo = "";
  String _healthRecord = "";
  String _staff = "";
  String _admin = "";

  Future<void> init() async {
    // Simulate a network call
    notifyListeners();
  }
}

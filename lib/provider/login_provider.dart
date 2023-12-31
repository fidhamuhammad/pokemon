import 'package:flutter/material.dart';

class AuthStatusProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  late String _email = '';

  bool get isLoggedIn => _isLoggedIn;
  String get email => _email;

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }
}

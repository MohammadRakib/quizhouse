import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier{

  String _email = '';
  String _password = '';
  String _errorMessage = '';

  String get email => _email;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get password => _password;

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String get errorMessage => _errorMessage;

  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }
}
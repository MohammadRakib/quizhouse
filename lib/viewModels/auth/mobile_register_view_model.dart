import 'package:flutter/material.dart';

class MobileRegisterViewModel extends ChangeNotifier{
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _errorMessage = '';

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get errorMessage => _errorMessage;

  set errorMessage(String value) {
    _errorMessage = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get confirmPassword => _confirmPassword;

  set confirmPassword(String value) {
    _confirmPassword = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }
}

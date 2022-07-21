import 'package:flutter/material.dart';

class MobileLoginViewModel extends ChangeNotifier{

  String _mobileNumber = '';

  String get mobileNumber => _mobileNumber;

  set mobileNumber(String value) {
    _mobileNumber = value;
    notifyListeners();
  }
}
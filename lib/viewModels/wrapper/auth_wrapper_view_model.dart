
import 'package:flutter/material.dart';

class AuthWrapperViewModel extends ChangeNotifier{

  bool _isLogin = false;

  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }
}
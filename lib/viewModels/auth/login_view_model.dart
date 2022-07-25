import 'package:flutter/material.dart';
import 'package:quizhouse/services/user_services.dart';

import '../../models/user_model.dart';

class LoginViewModel extends ChangeNotifier{

  String _email = '';
  String _password = '';

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

  Future<bool> login(String email, String password) async{
    return  await UserServices().login(email,password);
  }

}
import 'package:flutter/material.dart';
import 'package:quizhouse/models/user_model.dart';

import '../../services/auth_services.dart';

class RegisterViewModel extends ChangeNotifier{

  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  String get name => _name;

  set name(String value) {
    _name = value;
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

  Future<bool> register(bool loginStatus) async{
    UserModel _usermodel = UserModel(name: name.trim(), email: email.trim(), password: password.trim(), loginStatus: loginStatus,exp: 0,
                                      lvl: 1, coin: 10000, gems: 10000);
    return await AuthServices().register(_usermodel);
  }
}

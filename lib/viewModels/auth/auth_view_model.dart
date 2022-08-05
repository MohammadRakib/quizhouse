import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:quizhouse/models/user_model.dart';
import 'package:quizhouse/services/user_services.dart';

class AuthViewModel extends ChangeNotifier{
  bool _isLogin = false;
  bool _loading = true;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
  }

  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
    loading = false;
    notifyListeners();
  }

  AuthViewModel(){
    checkIfLogin();
  }

  //Check if login
  Future checkIfLogin()async{
    UserModel? currentUser = await UserServices().getCurrentUser();
    if(currentUser != null){
      isLogin = true;
    }else{
      isLogin = false;
    }
  }

  Future<bool> login(String email, String password) async{
    return await UserServices().login(email.trim(), password.trim());
  }

  // check if email format is correct
  bool emailValidate(String email){
    return EmailValidator.validate(email);
  }

  Future<bool> register(String name, String email, String password, bool loginStatus) async{
    UserModel userModel = UserModel(name: name.trim(), email: email.trim(), password: password.trim(), loginStatus: loginStatus,exp: 0,
        lvl: 1, coin: 10000, gems: 10000);
    return await UserServices().register(userModel);
  }

  Future<bool> logOut() async{
    return UserServices().logout();
  }

}
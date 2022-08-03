
import 'package:flutter/material.dart';
import 'package:quizhouse/services/user_services.dart';

import '../../models/user_model.dart';

class AuthWrapperViewModel extends ChangeNotifier{

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

  AuthWrapperViewModel(){
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

}
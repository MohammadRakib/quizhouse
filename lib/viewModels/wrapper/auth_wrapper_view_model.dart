
import 'package:flutter/material.dart';
import 'package:quizhouse/services/user_services.dart';

import '../../models/user_model.dart';

class AuthWrapperViewModel extends ChangeNotifier{

  bool _isLogin = false;

  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
  }

  void stateChange(){
    notifyListeners();
  }

  //Check if login
Future<bool> checkIfLogin()async{
  UserModel? currentUser = await UserServices().getCurrentUser();
  if(currentUser != null){
    return true;
  }else{
    return false;
  }
}

}
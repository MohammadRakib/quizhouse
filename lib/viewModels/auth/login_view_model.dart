import 'package:flutter/material.dart';
import 'package:quizhouse/services/user_services.dart';
import 'package:quizhouse/viewModels/wrapper/auth_wrapper_view_model.dart';

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

  Future onSignIn(GlobalKey<FormState> formKey, AuthWrapperViewModel wrapperViewModel, BuildContext context)async{

    if(formKey.currentState!.validate()) {

      String email = this.email.trim();
      String password = this.password.trim();
      bool loginSuccess = await login(email, password);
      if(loginSuccess){
        wrapperViewModel.isLogin = true;
        wrapperViewModel.stateChange();
        Navigator.pop(context);
      }else{
        SnackBar snackBar = const SnackBar(content: Text('email or password is wrong'),);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }


}
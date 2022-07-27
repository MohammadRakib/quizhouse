import 'package:flutter/material.dart';
import 'package:quizhouse/models/user_model.dart';
import 'package:quizhouse/viewModels/wrapper/auth_wrapper_view_model.dart';

import '../../services/user_services.dart';

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
    return await UserServices().register(_usermodel);
  }


  Future onRegister(GlobalKey<FormState> formKey, AuthWrapperViewModel wrapperViewModel, BuildContext context) async{

    if(formKey.currentState!.validate()){
      final registerSuccess = await register(true);
      if(registerSuccess){
        wrapperViewModel.isLogin = true;
        wrapperViewModel.stateChange();
        Navigator.pop(context);
        Navigator.pop(context);
      }else{
        SnackBar snackBar = const SnackBar(content: Text('user already exist'),);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

}

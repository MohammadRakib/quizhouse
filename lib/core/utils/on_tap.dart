// this method will be invoked when sign in button is pressed
import 'package:flutter/material.dart';
import 'package:quizhouse/viewModels/auth/mobile_login_view_model.dart';
import 'package:quizhouse/viewModels/auth/mobile_register_view_model.dart';
import 'package:quizhouse/viewModels/auth/register_view_model.dart';
import 'package:quizhouse/viewModels/wrapper/auth_wrapper_view_model.dart';
import 'package:quizhouse/views/auth/mobile_register_view.dart';
import '../../viewModels/auth/login_view_model.dart';


Future onMobileSignIn(GlobalKey<FormState> formKey, MobileLoginViewModel mobileLoginViewModel,
    AuthWrapperViewModel wrapperViewModel, BuildContext context) async {

    if(formKey.currentState!.validate()) {

      String phoneNumber = mobileLoginViewModel.mobileNumber.trim();
      // wrapperViewModel.isLogin = true;
      // Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute<String>(
        builder: (BuildContext context) => MobileRegisterView(),
      ),);
    }
}


Future onMobileRegister(GlobalKey<FormState> formKey, MobileRegisterViewModel mobileRegisterViewModel,
    AuthWrapperViewModel wrapperViewModel, BuildContext context) async {
  if (formKey.currentState!.validate()) {
    String name = mobileRegisterViewModel.name.trim();
    String email = mobileRegisterViewModel.email.trim();
    String password = mobileRegisterViewModel.password.trim();
    String confirmPassword = mobileRegisterViewModel.confirmPassword.trim();
    wrapperViewModel.isLogin = true;
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  } else {
    mobileRegisterViewModel.errorMessage = 'error';
    SnackBar snackBar = SnackBar(content: Text(mobileRegisterViewModel.errorMessage),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


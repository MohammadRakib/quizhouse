import 'package:flutter/material.dart';
import 'package:quizhouse/views/home/home_view.dart';
import 'package:quizhouse/views/auth/get_started_view.dart';
import 'package:quizhouse/viewModels/wrapper/auth_wrapper_view_model.dart';
import 'package:quizhouse/views/wrapper/home_wrapper.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthWrapperViewModel wrapperViewModel = context.watch<AuthWrapperViewModel>();
    return wrapperViewModel.isLogin? const HomeWrapper() : const GetStartedView();
  }
}

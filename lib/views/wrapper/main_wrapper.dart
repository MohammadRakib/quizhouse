import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizhouse/core/sharedWidgets/Loading.dart';
import 'package:quizhouse/models/user_model.dart';

import '../../viewModels/wrapper/auth_wrapper_view_model.dart';
import 'auth_wrapper.dart';
class MainWrapper extends StatelessWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthWrapperViewModel wrapperViewModel = context.watch<AuthWrapperViewModel>();
    return wrapperViewModel.loading? Loading() : AuthWrapper();
  }
}

import 'package:flutter/material.dart';
import 'package:quizhouse/core/sharedWidgets//mobile_number_field.dart';
import 'package:quizhouse/core/utils/on_tap.dart';
import 'package:quizhouse/views/auth/mobile_register_view.dart';
import 'package:quizhouse/viewModels/auth/mobile_login_view_model.dart';
import 'package:provider/provider.dart';

import '../../core/utils/color.dart';
import '../../core/utils/padding_margin.dart';
import '../../viewModels/wrapper/auth_wrapper_view_model.dart';

class MobileLoginView extends StatelessWidget {
  MobileLoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    AuthWrapperViewModel wrapperViewModel = context.watch<AuthWrapperViewModel>();
    MobileLoginViewModel mobileLoginViewModel = context.watch<MobileLoginViewModel>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(backGroundColor),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0,),
              Center(
                child: Image.asset('lib/assets/logo/quizLogo.png',
                  height: height/6,
                  width: width/2,
                ),
              ),

              const SizedBox(height: 20.0,),
              Text('Enter your phone number to sign in or register',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                  fontSize: height/45,
                ),
              ),

              const SizedBox(height: 60.0,),

              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingForTextFieldH),
                  child: MobileNumberField(formKey: _formKey),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(primaryColor),
          child: const Icon(
            Icons.arrow_forward_rounded,
            color: Color(floatingArrowIconColor),
          ),
          onPressed: () {
            onMobileSignIn(_formKey, mobileLoginViewModel, wrapperViewModel, context);
          },
        ),
      ),
    );
  }
}

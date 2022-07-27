import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizhouse/views/auth/mobile_login_view.dart';
import 'package:quizhouse/views/auth/register_view.dart';
import 'package:quizhouse/viewModels/auth/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../core/sharedWidgets//decoration.dart';
import '../../core/utils/color.dart';
import '../../core/utils/padding_margin.dart';
import '../../viewModels/wrapper/auth_wrapper_view_model.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    AuthWrapperViewModel wrapperViewModel = context.watch<AuthWrapperViewModel>();
    LoginViewModel loginViewModel = context.watch<LoginViewModel>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: const Color(backGroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(height: 50.0,),
              Center(
                child: Image.asset('lib/assets/logo/quizLogo.png',
                  height: height/6,
                  width: width/2,
                ),
              ),
              const SizedBox(height: 20.0,),
              Text('Welcome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: height/25,
                ),
              ),
              const SizedBox(height: 10.0,),

              Text('Sign-In to Continue!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                  fontSize: height/45,
                ),
              ),
              const SizedBox(height: 30.0,),

              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: paddingForTextFieldH),
                        child: TextFormField(
                          decoration: textFieldDecoration.copyWith(label: const Text('Email')),
                          validator: (val) => val!.isEmpty ? 'Please enter email':null,
                          onChanged: (val){
                            loginViewModel.email = val;
                          },
                        ),
                      ),

                      const SizedBox(height: 30.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: paddingForTextFieldH),
                        child: TextFormField(
                          decoration: textFieldDecoration.copyWith(label: const Text('Password')),
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          maxLength: 6,
                          obscureText: true,
                          validator: (val) => val!.length < 6 ? 'Password must be minimum 6 character':null ,
                          onChanged: (val){
                            loginViewModel.password = val;
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: paddingForTextFieldH),
                            child: TextButton(
                                onPressed: (){

                                },
                                child: const Text('Forgot Password?',
                                  style: TextStyle(
                                    color: Color(forgotPasswordColor),
                                  ),
                                ),
                                style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(const Color(backGroundColor)),
                                ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20.0,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: paddingForTextFieldH),
                       child:  ElevatedButton(
                         style: ButtonStyle(
                           minimumSize: orientation == Orientation.portrait? MaterialStateProperty.all(const Size.fromHeight(40)) : MaterialStateProperty.all(const Size.fromHeight(40)),
                           backgroundColor: MaterialStateProperty.all(const Color(primaryColor)),
                           shape: MaterialStateProperty.all(RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(16.0),
                           )),
                         ),
                         onPressed: (){
                           loginViewModel.onSignIn(_formKey, wrapperViewModel, context);
                         },
                         child: const Text('Sign In'),
                       ),
                     ),

                      const SizedBox(height: 30.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: paddingForTextFieldH),
                        child:  OutlinedButton(
                          style: ButtonStyle(
                            minimumSize: orientation == Orientation.portrait? MaterialStateProperty.all(const Size.fromHeight(40)) : MaterialStateProperty.all(const Size.fromHeight(40)),
                            overlayColor: MaterialStateProperty.all(const Color(secondaryColor)),
                            foregroundColor: MaterialStateProperty.all(const Color(primaryColor)),
                            side: MaterialStateProperty.all(const BorderSide(
                              color: Color(primaryColor),
                              width: 1.0,
                            )),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            )),
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute<String>(
                              builder: (BuildContext context) => MobileLoginView(),
                            ),);
                          },
                          child: const Text('Phone Sign In'),
                        ),
                      ),
                      const SizedBox(height: 30.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute<String>(
                                  builder: (BuildContext context) => RegisterView(),
                                ),);
                              },
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(const Color(backGroundColor)),
                            ),
                              child: const Text('Sign up Now!',
                              style: TextStyle(
                                color: Color(primaryColor),
                              ),
                              ),
                          ),
                        ],
                      ),
                    ],
                  )),

              const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
}

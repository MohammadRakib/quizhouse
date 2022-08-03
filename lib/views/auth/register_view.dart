import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizhouse/viewModels/auth/register_view_model.dart';
import 'package:quizhouse/views/auth/login_view.dart';
import 'package:provider/provider.dart';


import '../../core/sharedWidgets/decoration.dart';
import '../../core/utils/color.dart';
import '../../core/utils/on_tap.dart';
import '../../core/utils/padding_margin.dart';
import '../../viewModels/auth/login_view_model.dart';
import '../../viewModels/wrapper/auth_wrapper_view_model.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String errorMessage = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    AuthWrapperViewModel wrapperViewModel = context.watch<AuthWrapperViewModel>();
    RegisterViewModel registerViewModel = context.watch<RegisterViewModel>();
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
              const SizedBox(height: 30.0,),
              Center(
                child: Image.asset('lib/assets/logo/quizLogo.png',
                  height: height/7,
                  width: width/3,
                ),
              ),
              const SizedBox(height: 5.0,),
              Text('Create an Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: height/30,
                ),
              ),
              const SizedBox(height: 5.0,),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text('Sign-up to get Started',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                          fontSize: height/45,
                        ),
                      ),

                      const SizedBox(height: 35.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: paddingForTextFieldH),
                        child: TextFormField(
                          decoration: textFieldDecoration.copyWith(label: const Text('Name')),
                          validator: (val) => val!.isEmpty ? 'Please enter your name':null,
                          onChanged: (val){
                            registerViewModel.name = val.trim();
                          },
                        ),
                      ),

                      const SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: paddingForTextFieldH),
                        child: TextFormField(
                          decoration: textFieldDecoration.copyWith(label: const Text('Email')),
                          validator: (val) => val!.isEmpty ? 'Please enter email':null,
                          onChanged: (val){
                            registerViewModel.email = val.trim();
                          },
                        ),
                      ),

                      const SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: paddingForTextFieldH),
                        child: TextFormField(
                          decoration: textFieldDecoration.copyWith(label: const Text('Password')),
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          maxLength: 6,
                          obscureText: true,
                          validator: (val) => val!.length < 6 ? 'Password must be minimum 6 character':null ,
                          onChanged: (val){
                            registerViewModel.password = val.trim();
                          },
                        ),
                      ),

                      const SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: paddingForTextFieldH),
                        child: TextFormField(
                          decoration: textFieldDecoration.copyWith(label: const Text('Confirm Password')),
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          maxLength: 6,
                          obscureText: true,
                          validator: (val) => val != registerViewModel.password ? 'Please enter correct password':null ,
                          onChanged: (val){
                            registerViewModel.confirmPassword = val.trim();
                          },
                        ),
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
                          onPressed: ()async{
                            if(_formKey.currentState!.validate()){
                              bool isSuccess = await registerViewModel.onRegister();
                              if(isSuccess){
                                wrapperViewModel.checkIfLogin();
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }else{
                                SnackBar snackBar = const SnackBar(content: Text('user already exist'),);
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            }
                          },
                          child: const Text('Sign Up'),
                        ),
                      ),

                      const SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('I\'m already a member |'),
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: const Text('Sign-In',
                              style: TextStyle(
                                color: Color(primaryColor),
                              ),
                            ),
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(const Color(backGroundColor)),
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

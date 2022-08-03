import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizhouse/viewModels/auth/auth_view_model.dart';
import 'package:quizhouse/views/auth/register_view.dart';
import 'package:provider/provider.dart';
import '../../core/sharedWidgets//decoration.dart';
import '../../core/utils/color.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
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
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextFormField(
                          decoration: textFieldDecoration.copyWith(label: const Text('Email')),
                          validator: (val) => val!.isEmpty ? 'Please enter email':null,
                          onChanged: (val){
                            email = val;
                          },
                        ),
                      ),

                      const SizedBox(height: 30.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextFormField(
                          decoration: textFieldDecoration.copyWith(label: const Text('Password')),
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          maxLength: 6,
                          obscureText: true,
                          validator: (val) => val!.length < 6 ? 'Password must be minimum 6 character':null ,
                          onChanged: (val){
                            password = val;
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
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
                       padding: const EdgeInsets.symmetric(horizontal: 50),
                       child:  ElevatedButton(
                         style: ButtonStyle(
                           minimumSize: orientation == Orientation.portrait? MaterialStateProperty.all(const Size.fromHeight(40)) : MaterialStateProperty.all(const Size.fromHeight(40)),
                           backgroundColor: MaterialStateProperty.all(const Color(primaryColor)),
                           shape: MaterialStateProperty.all(RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(16.0),
                           )),
                         ),
                         onPressed: () async{
                            if(_formKey.currentState!.validate()) {
                              bool isSignIn = await authViewModel.login(email, password);
                              if(isSignIn){
                                authViewModel.checkIfLogin();
                              }else{
                                SnackBar snackBar = const SnackBar(content: Text('email or password is wrong'),);
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            }

                         },
                         child: const Text('Sign In'),
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

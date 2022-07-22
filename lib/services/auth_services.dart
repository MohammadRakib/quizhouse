import 'package:quizhouse/models/user_model.dart';

class AuthServices{

  static final AuthServices _authServices = AuthServices._();
  AuthServices._();
  factory AuthServices(){
    return _authServices;
  }

 Future register(UserModel userModel) async{

}

}
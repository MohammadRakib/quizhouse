import 'package:flutter/cupertino.dart';
import 'package:quizhouse/models/user_model.dart';
import 'package:quizhouse/services/auth_services.dart';

class HomeViewModel extends ChangeNotifier{
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  set currentUser(UserModel? value) {
    _currentUser = value;
    notifyListeners();
  }

  HomeViewModel(){
    getCurrentUser();
  }

  Future getCurrentUser() async{
     currentUser = await AuthServices().getCurrentUser();
  }
}
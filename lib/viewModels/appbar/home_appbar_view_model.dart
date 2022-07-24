import 'package:flutter/cupertino.dart';
import 'package:quizhouse/models/user_model.dart';

class HomeAppBarViewModel{
String _name = 'Dummy';
String _level = '1';
UserModel? userModel;

HomeAppBarViewModel({required this.userModel}){
 name = userModel!.name;
 level = userModel!.lvl.toString();
}

String get name => _name;

  set name(String value) {
    _name = value;
  }

String get level => _level;

  set level(String value) {
    _level = value;
  }
}

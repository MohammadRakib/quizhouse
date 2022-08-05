import 'package:flutter/material.dart';
import 'package:quizhouse/models/user_model.dart';
import 'package:quizhouse/services/user_services.dart';

class UserViewModel extends ChangeNotifier{
  String _name = 'Dummy';
  dynamic _levelPercentage = '100';
  dynamic _level = '100';
  dynamic _coin = '10000';
  dynamic _gems = '10000';

  UserViewModel(){
    getCurrentUser();
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  dynamic get levelPercentage => _levelPercentage;

  set levelPercentage(dynamic value) {
    _levelPercentage = value;
  }

  dynamic get gems => _gems;

  set gems(dynamic value) {
    _gems = value;
    notifyListeners();
  }

  dynamic get coin => _coin;

  set coin(dynamic value) {
    _coin = value;
  }

  dynamic get level => _level;

  set level(dynamic value) {
    _level = value;
  }

  Future getCurrentUser() async{
    UserModel? currentUser = await UserServices().getCurrentUser();
    setAllValue(currentUser!.name, currentUser.lvl.toString(), currentUser.exp.toString(), currentUser.coin.toString(), currentUser.gems.toString());
  }

  void setAllValue(String name, String level, String levelPercentage, String coin, String gems){
    this.name = name;
    this.level = level;
    this.levelPercentage = levelPercentage;
    this.coin = coin;
    this.gems = gems;
  }

  Future updateUserExp() async{
    await UserServices().updateUserExp();
    getCurrentUser(); // update all value of the user in the view
  }

}
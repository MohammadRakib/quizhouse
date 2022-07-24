
import 'package:flutter/material.dart';
import 'package:quizhouse/models/user_model.dart';

class PlayerStatusViewModel{
  String _level = '100';
  String _levelPercentage = '100';
  String _coin = '100000000';
  String _gems = '100000000';
  UserModel? userModel;

  PlayerStatusViewModel({required this.userModel}){
    level = userModel!.lvl.toString();
    levelPercentage = userModel!.exp.toString();
    coin = userModel!.coin.toString();
    gems = userModel!.gems.toString();
  }

  String get level => _level;

  set level(String value) {
    _level = value;
  }

  String get coin => _coin;

  set coin(String value) {
    _coin = value;
  }

  String get gems => _gems;

  set gems(String value) {
    _gems = value;
  }


  String get levelPercentage => _levelPercentage;

  set levelPercentage(String value) {
    _levelPercentage = value;
  }

}

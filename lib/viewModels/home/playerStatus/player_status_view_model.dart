
import 'package:flutter/material.dart';

class PlayerStatusViewModel extends ChangeNotifier{
  String _level = '100';
  String _levelPercentage = '100';
  String _coin = '100000000';
  String _gems = '100000000';

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

  void setStatus(String level, String levelPercentage, String coin, String gems){
    this.level = level;
    this.levelPercentage = levelPercentage;
    this.coin = coin;
    this.gems = gems;
    notifyListeners();
  }

}

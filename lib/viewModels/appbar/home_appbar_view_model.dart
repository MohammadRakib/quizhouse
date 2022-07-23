import 'package:flutter/cupertino.dart';

class HomeAppBarViewModel extends ChangeNotifier{
String _name = 'Dummy';
String _level = '1';

String get name => _name;

  set name(String value) {
    _name = value;
  }

String get level => _level;

  set level(String value) {
    _level = value;
  }
}

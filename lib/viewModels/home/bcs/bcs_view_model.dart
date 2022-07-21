import 'package:flutter/material.dart';
import 'package:quizhouse/models/bcs_model.dart';

class BcsViewModel extends ChangeNotifier{

  int _current = 0;
  List<BcsModel> _items = [];

  List<BcsModel> get items => _items;

  set items(List<BcsModel> value) {
    _items = value;
    notifyListeners();
  }


  int get current => _current;

  set current(int value) {
    _current = value;
    notifyListeners();
  }

  final List<BcsModel> _bcsList = [
    BcsModel(title: 'BCS Model Test 1', questionNumber: '50', duration: '30',price: '10 Taka'),
    BcsModel(title: 'BCS Model Test 2', questionNumber: '50', duration: '30',price: '10 Taka'),
    BcsModel(title: 'BCS Model Test 3', questionNumber: '50', duration: '30',price: '10 Taka'),
    BcsModel(title: 'BCS Model Test 4', questionNumber: '50', duration: '30',price: '10 Taka'),
  ];

  BcsViewModel(){
    getBcs();
  }

  Future getBcs()async{
    items = _bcsList;
  }

}

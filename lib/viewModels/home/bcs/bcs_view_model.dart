import 'package:flutter/material.dart';
import 'package:quizhouse/models/bcs_model.dart';
import 'package:quizhouse/services/bcs_services.dart';
import 'package:quizhouse/views/home/bcs/bcs_item_view.dart';

class BcsViewModel extends ChangeNotifier{

  int _current = 0;
  List<BcsModel> _items = [];
  List<BcsItemView> _bcsItemList = [];
  List<Widget> _bcsSlider = [];

  List<Widget> get bcsSlider => _bcsSlider;

  set bcsSlider(List<Widget> value) {
    _bcsSlider = value;
    notifyListeners();
  }

  List<BcsItemView> get bcsItemList => _bcsItemList;

  set bcsItemList(List<BcsItemView> value) {
    _bcsItemList = value;
  }

  List<BcsModel> get items => _items;

  set items(List<BcsModel> value) {
    _items = value;
  }


  int get current => _current;

  set current(int value) {
    _current = value;
    notifyListeners();
  }

  BcsViewModel(){
    getBcs();
  }

  Future getBcs()async{
    items = await BcsServices().getBcs();
    bcsItemList = generateBcsItem();
    bcsSlider = generateBcsSliderList();
  }

  List<BcsItemView> generateBcsItem(){
    return List.generate(items.length, (index) => BcsItemView(title: items[index].title,
        questionNumber: items[index].questionNumber, duration: items[index].duration,
        price: items[index].price));
  }

  List<Widget> generateBcsSliderList(){
    return bcsItemList
        .map((item) => Stack(
      children: <Widget>[
        item,
      ],
    ))
        .toList();
  }

}

import 'package:flutter/material.dart';
import 'package:quizhouse/models/category_model.dart';
import 'package:quizhouse/services/category_services.dart';

class CategoryViewModel extends ChangeNotifier{
  List<CategoryModel> _items = [];

  List<CategoryModel> get items => _items;

  set items(List<CategoryModel> value) {
    _items = value;
  }


  CategoryViewModel(){
    getCategory();
  }

  Future getCategory() async{
    items = await CategoryServices().getCategory();
    notifyListeners();
  }
}
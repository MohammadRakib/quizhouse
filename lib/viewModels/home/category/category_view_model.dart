import 'package:flutter/material.dart';
import 'package:quizhouse/models/category_model.dart';

class CategoryViewModel extends ChangeNotifier{
  List<CategoryModel> _items = [];

  List<CategoryModel> get items => _items;

  set items(List<CategoryModel> value) {
    _items = value;
    notifyListeners();
  }

  final List<CategoryModel> _categoryList = [
    //   CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
    // CategoryModel(title: 'Fruits and Vegetable', imageUri: 'lib/assets/dummyImage2.png', favourite: false),
  ];

  CategoryViewModel(){
    getCategory();
  }

  Future getCategory() async{
    // get data from database
    // items = await getCategoryController.getCategory();
    items = _categoryList;
  }
}
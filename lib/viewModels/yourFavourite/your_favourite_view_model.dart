import 'package:flutter/material.dart';
import 'package:quizhouse/models/your_favourite_model.dart';

class YourFavouriteViewModel extends ChangeNotifier{

  List<YourFavouriteModel> _items = [];

  List<YourFavouriteModel> get items => _items;

  set items(List<YourFavouriteModel> value) {
    _items = value;
    notifyListeners();
  }

  final List<YourFavouriteModel> _yourFavouriteList = [
    YourFavouriteModel(image: 'lib/assets/dummyImage2.png', title: 'Gaming', completion: '2'),
    YourFavouriteModel(image: 'lib/assets/dummyImage2.png', title: 'Food & Health', completion: '6'),
    YourFavouriteModel(image: 'lib/assets/dummyImage2.png', title: 'Bangladesh', completion: '20'),
    YourFavouriteModel(image: 'lib/assets/dummyImage2.png', title: 'ICQ', completion: '2'),
    YourFavouriteModel(image: 'lib/assets/dummyImage2.png', title: 'Movie', completion: '0'),
    YourFavouriteModel(image: 'lib/assets/dummyImage2.png', title: 'Famous Person', completion: '2'),
  ];

  YourFavouriteViewModel(){
    getYourFavourites();
  }

  Future getYourFavourites() async{
    items = _yourFavouriteList;
  }

}
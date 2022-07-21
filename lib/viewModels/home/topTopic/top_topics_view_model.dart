import 'package:flutter/material.dart';
import 'package:quizhouse/models/top_topics_model.dart';

class TopTopicsViewModel extends ChangeNotifier{
  List<TopTopicsModel> _items = [];

  List<TopTopicsModel> get items => _items;

  set items(List<TopTopicsModel> value) {
    _items = value;
    notifyListeners();
  }

  final List<TopTopicsModel> _topTopicsList = [
    TopTopicsModel(imageUri: 'lib/assets/dummyImage2.png', title: 'Fruits and Vegetable'),
    TopTopicsModel(imageUri: 'lib/assets/dummyImage2.png', title: 'Football Team'),
    TopTopicsModel(imageUri: 'lib/assets/dummyImage2.png', title: 'Cricket Team'),
    TopTopicsModel(imageUri: 'lib/assets/dummyImage2.png', title: 'Gaming'),
    TopTopicsModel(imageUri: 'lib/assets/dummyImage2.png', title: 'International Topics'),
    TopTopicsModel(imageUri: 'lib/assets/dummyImage2.png', title: 'National Topics'),
  ];

  TopTopicsViewModel(){
    getTopTopics();
  }

  Future getTopTopics() async{
    // get data from database
    // items = await topTopicsController.getTopTopics();
    items = _topTopicsList;
  }

}
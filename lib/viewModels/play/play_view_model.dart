 import 'package:flutter/material.dart';
import 'package:quizhouse/models/play_model.dart';

class PlayViewModel extends ChangeNotifier{

 List<PlayModel> _items = [];
 var _optionBorderColor1 = 0xFFBDBDBD;
 var _optionBorderColor2 = 0xFFBDBDBD;
 var _optionBorderColor3 = 0xFFBDBDBD;
 var _optionBorderColor4 = 0xFFBDBDBD;
 int _questionIndex = 0;

 int get questionIndex => _questionIndex;

  set questionIndex(int value) {
    _questionIndex = value;
    _optionBorderColor1 = 0xFFBDBDBD;
    _optionBorderColor2 = 0xFFBDBDBD;
    _optionBorderColor3 = 0xFFBDBDBD;
    _optionBorderColor4 = 0xFFBDBDBD;
    notifyListeners();
  }

  get optionBorderColor1 => _optionBorderColor1;

  set optionBorderColor1(value) {
    _optionBorderColor1 = value;
    _optionBorderColor2 = 0xFFBDBDBD;
    _optionBorderColor3 = 0xFFBDBDBD;
    _optionBorderColor4 = 0xFFBDBDBD;
    notifyListeners();
  }


 List<PlayModel> get items => _items;

  set items(List<PlayModel> value) {
    _items = value;
    notifyListeners();
  }

 final List<PlayModel> _playList = [
    PlayModel(
        questionNo: 1,
        title: 'dummy question',
        hasImage: true,
        imageUri: 'lib/assets/dummyImage.png',
        time: '10',
        question: 'Asking dummy question?',
        answer: 'answer 2',
        option1: 'answer 1', option2: 'answer 2', option3: 'answer 3', option4: 'answer 4'),
   PlayModel(
       questionNo: 2,
       title: 'dummy question',
       hasImage: true,
       imageUri: 'lib/assets/dummyImage.png',
       time: '10',
       question: 'Asking dummy question?',
       answer: 'answer 1',
       option1: 'answer 1', option2: 'answer 2', option3: 'answer 3', option4: 'answer 4'),
   PlayModel(
       questionNo: 3,
       title: 'dummy question',
       hasImage: true,
       imageUri: 'lib/assets/dummyImage.png',
       time: '10',
       question: 'Asking dummy question?',
       answer: 'answer 4',
       option1: 'answer 1', option2: 'answer 2', option3: 'answer 3', option4: 'answer 4'),
 ];

  PlayViewModel(){
   getPlay();
  }

 Future getPlay() async{
  // get data from database
  // items = await getCategoryController.getCategory();
  items = _playList;
 }

 void updateQuestionNo(int index){
   items[index].questionNo = items[index].questionNo + 1;
   notifyListeners();
 }

  get optionBorderColor2 => _optionBorderColor2;

  set optionBorderColor2(value) {
    _optionBorderColor2 = value;
    _optionBorderColor1 = 0xFFBDBDBD;
    _optionBorderColor3 = 0xFFBDBDBD;
    _optionBorderColor4 = 0xFFBDBDBD;
    notifyListeners();
  }

  get optionBorderColor3 => _optionBorderColor3;

  set optionBorderColor3(value) {
    _optionBorderColor3 = value;
    _optionBorderColor2 = 0xFFBDBDBD;
    _optionBorderColor1 = 0xFFBDBDBD;
    _optionBorderColor4 = 0xFFBDBDBD;
    notifyListeners();
  }

  get optionBorderColor4 => _optionBorderColor4;

  set optionBorderColor4(value) {
    _optionBorderColor4 = value;
    _optionBorderColor2 = 0xFFBDBDBD;
    _optionBorderColor3 = 0xFFBDBDBD;
    _optionBorderColor1 = 0xFFBDBDBD;
    notifyListeners();
  }
}
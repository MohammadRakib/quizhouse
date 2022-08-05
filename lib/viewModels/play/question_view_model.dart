 import 'package:flutter/material.dart';
import 'package:quizhouse/models/question_model.dart';
import 'package:quizhouse/services/question_services.dart';

class QuestionViewModel extends ChangeNotifier{

 List<QuestionModel> _items = [];
 var _optionBorderColor1 = 0xFFBDBDBD;
 var _optionBorderColor2 = 0xFFBDBDBD;
 var _optionBorderColor3 = 0xFFBDBDBD;
 var _optionBorderColor4 = 0xFFBDBDBD;
 int _questionIndex = 0;
 int _time = 12;

  int get time => _time;

  set time(int value) {
    _time = value;
  }

  int get questionIndex => _questionIndex;

  set questionIndex(int value) {
    _questionIndex = value;
    _optionBorderColor1 = 0xFFBDBDBD;
    _optionBorderColor2 = 0xFFBDBDBD;
    _optionBorderColor3 = 0xFFBDBDBD;
    _optionBorderColor4 = 0xFFBDBDBD;
  }

  get optionBorderColor1 => _optionBorderColor1;

  set optionBorderColor1(value) {
    _optionBorderColor1 = value;
    _optionBorderColor2 = 0xFFBDBDBD;
    _optionBorderColor3 = 0xFFBDBDBD;
    _optionBorderColor4 = 0xFFBDBDBD;
    notifyListeners();
  }

 List<QuestionModel> get items => _items;

  set items(List<QuestionModel> value) {
    _items = value;
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

  QuestionViewModel(){
    initQuestion();
  }

  Future initQuestion() async{
    await QuestionServices().createQuestion();
  }

  Future getQuestionByCategory(int categoryId) async{
    if(items.isEmpty){
      items = await QuestionServices().getQuestionByCategory(categoryId);
      notifyListeners();
    }
  }

 Future getQuestionByRandom() async{
   if(items.isEmpty){
     items = await QuestionServices().getQuestionByRandom();
     notifyListeners();
   }
 }

  void changeState(){
    notifyListeners();
  }
}
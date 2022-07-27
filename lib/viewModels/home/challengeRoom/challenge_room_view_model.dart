import 'package:flutter/material.dart';
import 'package:quizhouse/models/challenge_room_model.dart';

class ChallengeRoomViewModel extends ChangeNotifier{

  int _current = 0;
  List<ChallengeRoomModel> _items = [];

  final List<ChallengeRoomModel> _challengeList = [
    ChallengeRoomModel(name: 'Sports Quiz', prize: '2000', entryFee: '1000', color: '0xFFBCAAA4'),
    ChallengeRoomModel(name: 'Movie Quiz', prize: '2000', entryFee: '1000', color: '0XFFFFB74D'),
    ChallengeRoomModel(name: 'GK Quiz', prize: '2000', entryFee: '1000', color: '0XFF78909C'),
    ChallengeRoomModel(name: 'IQ Quiz', prize: '2000', entryFee: '1000', color: '0XFF9575CD'),
    ChallengeRoomModel(name: 'Food Quiz', prize: '1000', entryFee: '500', color: '0XFF5C6BC0'),
  ];


  ChallengeRoomViewModel(){
    getChallenge();
  }

  int get current => _current;

  set current(int value) {
    _current = value;
    notifyListeners();
  }

  List<ChallengeRoomModel> get items => _items;

  set items(List<ChallengeRoomModel> value) {
    _items = value;
    notifyListeners();
  }

  Future getChallenge() async{
    // get data from database
    // items = await chalengeRoomController.getChallenge();
    items = _challengeList;
  }

}
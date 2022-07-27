import 'package:flutter/material.dart';
import 'package:quizhouse/models/challenge_room_model.dart';
import 'package:quizhouse/services/challenge_room_services.dart';
import 'package:quizhouse/views/home/challengeRoom/challenge_room_items_view.dart';

class ChallengeRoomViewModel extends ChangeNotifier{

  int _current = 0;
  List<ChallengeRoomModel> _items = [];
  List<ChallengeRoomItemsView> _challengeRoomItems = [];
  List<Widget> _challengeListSliders = [];

  List<Widget> get challengeListSliders => _challengeListSliders;

  set challengeListSliders(List<Widget> value) {
    _challengeListSliders = value;
    notifyListeners();
  }

  List<ChallengeRoomItemsView> get challengeRoomItems => _challengeRoomItems;

  set challengeRoomItems(List<ChallengeRoomItemsView> value) {
    _challengeRoomItems = value;
  }

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
  }

  Future getChallenge() async{
    items = await ChallengeRoomServices().getChallengeRoom();
    challengeRoomItems = generateChallengeRoomItemsList();
    challengeListSliders = createChallengeListSliders();
  }

  List<ChallengeRoomItemsView> generateChallengeRoomItemsList(){
    return List.generate(items.length, (index) => ChallengeRoomItemsView(name: items[index].name,
                                                  prize: items[index].prize,
                                                  entryFee: items[index].entryFee, color: int.parse(items[index].color)
                                                  ));
  }

  List<Widget> createChallengeListSliders(){
    return challengeRoomItems
        .map((item) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: Stack(
          children: <Widget>[
            item,
          ],
        )))
        .toList();
  }

}
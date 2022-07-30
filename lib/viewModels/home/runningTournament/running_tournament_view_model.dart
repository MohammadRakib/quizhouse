import 'package:flutter/material.dart';
import 'package:quizhouse/models/running_tournament_model.dart';
import 'package:quizhouse/services/tournament_services.dart';
import 'package:quizhouse/views/home/runningTournament/running_tournament_item_view.dart';

class RunningTournamentViewModel extends ChangeNotifier{
  List<RunningTournamentModel> _items = [];
  List<RunningTournamentItemView> _runningTournamentItemList = [];


  List<RunningTournamentItemView> get runningTournamentItemList =>
      _runningTournamentItemList;

  set runningTournamentItemList(List<RunningTournamentItemView> value) {
    _runningTournamentItemList = value;
    notifyListeners();
  }

  List<RunningTournamentModel> get items => _items;

  set items(List<RunningTournamentModel> value) {
    _items = value;
  }


  RunningTournamentViewModel(){
      getRunningTournament();
  }

  Future getRunningTournament() async{

    items = await TournamentServices().getRunningTournament();
    runningTournamentItemList = generateRunningTournamentItem();
  }

  List<RunningTournamentItemView> generateRunningTournamentItem(){
     return List.generate(items.length, (index) => RunningTournamentItemView(title: items[index].title,
                                                    time: items[index].time,
                                                    prize: items[index].prize,
                                                    color: int.parse(items[index].color)));
  }
}
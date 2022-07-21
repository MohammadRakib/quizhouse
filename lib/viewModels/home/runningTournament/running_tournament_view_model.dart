import 'package:flutter/material.dart';
import 'package:quizhouse/models/running_tournament_model.dart';

class RunningTournamentViewModel extends ChangeNotifier{
  List<RunningTournamentModel> _items = [];

  List<RunningTournamentModel> get items => _items;

  set items(List<RunningTournamentModel> value) {
    _items = value;
    notifyListeners();
  }


  final List<RunningTournamentModel> _runningTournamentList = [
    RunningTournamentModel(title: 'QG Mega Quiz', time: '1 week', prize: 'Samsung Smart Phone!',color: '0xFFBCAAA4'),
    RunningTournamentModel(title: 'QG EID Quiz 1', time: '3 days', prize: '30000 Taka!',color: '0xFFFFB74D'),
    RunningTournamentModel(title: 'QG EID Quiz 2', time: '1 week', prize: '20000 Taka!',color: '0xFF78909C'),
    RunningTournamentModel(title: 'QG Small Quiz', time: '5 hours', prize: '5000 Taka!',color: '0xFF9575CD'),
  ];


  RunningTournamentViewModel(){
      getRunningTournament();
  }

  Future getRunningTournament() async{
    // get data from database
    // items = await RunningTournamentController.getRunningTournament();
    items = _runningTournamentList;
  }
}
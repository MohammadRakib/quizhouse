import 'package:quizhouse/models/running_tournament_model.dart';

import 'db_repository.dart';

class TournamentRepository{
  Future createTournamentTable() async{
    final db = await DbRepository().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String title = 'title TEXT NOT NULL';
    String time = 'time TEXT NOT NULL';
    String prize = 'prize TEXT NOT NULL';
    String color = 'color TEXT NOT NULL';

    String sqlTournament = 'CREATE TABLE IF NOT EXISTS tournament($id, $title, $time, $prize, $color)';
    db.execute(sqlTournament);
  }

  Future addTournament(List<RunningTournamentModel> runningTournamentList) async{
    final db = await DbRepository().database;

    for(RunningTournamentModel x in runningTournamentList){
      await db.insert('tournament', x.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> loadTournament() async{
    final db = await DbRepository().database;
    final List<Map<String, dynamic>> maps = await db.query('tournament');

    final List<RunningTournamentModel> runningTournamentList = [
      RunningTournamentModel(title: 'QG Mega Quiz', time: 'Permanent', prize: 'Samsung Smart Phone!',color: '0xFFBCAAA4'),
      RunningTournamentModel(title: 'QG EID Quiz 1', time: 'Permanent', prize: '30000 Taka!',color: '0xFFFFB74D'),
      RunningTournamentModel(title: 'QG EID Quiz 2', time: 'Permanent', prize: '20000 Taka!',color: '0xFF78909C'),
      RunningTournamentModel(title: 'QG Small Quiz', time: 'Permanent', prize: '5000 Taka!',color: '0xFF9575CD'),
    ];

    if(maps.isNotEmpty){
      return maps;
    }else{
      await addTournament(runningTournamentList);
      return await loadTournament();
    }
  }

}
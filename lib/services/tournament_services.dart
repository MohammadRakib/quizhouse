import 'package:quizhouse/models/running_tournament_model.dart';
import 'package:quizhouse/repository/tournament_repository.dart';

class TournamentServices{
  Future<List<RunningTournamentModel>> getRunningTournament() async{
    TournamentRepository tournamentRepository = TournamentRepository();
    await tournamentRepository.createTournamentTable();
    List<Map<String, dynamic>> maps = await tournamentRepository.loadTournament();
    if(maps.isNotEmpty){
      final runningTournamentList = List.generate(maps.length, (i) {
        return RunningTournamentModel(title: maps[i]['title'],
                                      time: maps[i]['time'],
                                      prize: maps[i]['prize'],
                                      color: maps[i]['color']);
      });
      return runningTournamentList;
    }
    return [];
  }
}
import 'package:quizhouse/models/challenge_room_model.dart';
import 'package:quizhouse/repository/challenge_room_repository.dart';

class ChallengeRoomServices{

  Future<List<ChallengeRoomModel>> getChallengeRoom() async{
    ChallengeRoomRepository challengeRoomRepository = ChallengeRoomRepository();
    await challengeRoomRepository.createChallengeRoomTable();
    List<Map<String, dynamic>> maps = await challengeRoomRepository.loadChallengeRoom();
    if(maps.isNotEmpty){
      final challengeRoomList = List.generate(maps.length, (i) {
        return ChallengeRoomModel(name: maps[i]['name'], prize: maps[i]['prize'], entryFee: maps[i]['entryFee'], color: maps[i]['color']);
      });
      return challengeRoomList;
    }
    return [];
  }

}
import 'package:quizhouse/models/challenge_room_model.dart';

import 'db_repository.dart';

class ChallengeRoomRepository{

  Future createChallengeRoomTable() async{
    final db = await DbRepository().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String name = 'name TEXT NOT NULL';
    String prize = 'prize TEXT NOT NULL';
    String entryFee = 'entryFee TEXT NOT NULL';
    String color = 'color TEXT NOT NULL';

    String sqlChallengeRoom = 'CREATE TABLE IF NOT EXISTS challengeRoom($id, $name, $prize, $entryFee, $color)';
    db.execute(sqlChallengeRoom);
  }

  Future addChallengeRoom(List<ChallengeRoomModel> challengeList) async{
    final db = await DbRepository().database;

    for(ChallengeRoomModel x in challengeList){
      await db.insert('challengeRoom', x.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> loadChallengeRoom() async{
    final db = await DbRepository().database;
    final List<Map<String, dynamic>> maps = await db.query('challengeRoom');

    final List<ChallengeRoomModel> challengeList = [
      ChallengeRoomModel(name: 'Challenge 1', prize: '2000', entryFee: '1000', color: '0xFFBCAAA4'),
      ChallengeRoomModel(name: 'Challenge 2', prize: '2000', entryFee: '1000', color: '0XFFFFB74D'),
      ChallengeRoomModel(name: 'Challenge 3', prize: '2000', entryFee: '1000', color: '0XFF78909C'),
      ChallengeRoomModel(name: 'Challenge 4', prize: '2000', entryFee: '1000', color: '0XFF9575CD'),
      ChallengeRoomModel(name: 'Challenge 5', prize: '1000', entryFee: '500', color: '0XFF5C6BC0'),
    ];

    if(maps.isNotEmpty){
      return maps;
    }else{
      await addChallengeRoom(challengeList);
      return await loadChallengeRoom();
    }
  }
}
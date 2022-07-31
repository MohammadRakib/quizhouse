import 'package:quizhouse/models/bcs_model.dart';

import 'db_repository.dart';

class BcsRepository{
  Future createBcsTable() async{
    final db = await DbRepository().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String title = 'title TEXT NOT NULL';
    String questionNumber = 'questionNumber TEXT NOT NULL';
    String duration = 'duration TEXT NOT NULL';
    String price = 'price TEXT NOT NULL';

    String sqlBcs = 'CREATE TABLE IF NOT EXISTS BCS($id, $title, $questionNumber, $duration, $price)';
    db.execute(sqlBcs);
  }

  Future addBcs(List<BcsModel> bcsList) async{
    final db = await DbRepository().database;

    for(BcsModel x in bcsList){
      await db.insert('BCS', x.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> loadBcs() async{
    final db = await DbRepository().database;
    final List<Map<String, dynamic>> maps = await db.query('BCS');

    final List<BcsModel> bcsList = [
      BcsModel(title: 'BCS Model Test 1', questionNumber: '50', duration: '30',price: '10 Taka'),
      BcsModel(title: 'BCS Model Test 2', questionNumber: '50', duration: '30',price: '10 Taka'),
      BcsModel(title: 'BCS Model Test 3', questionNumber: '50', duration: '30',price: '10 Taka'),
      BcsModel(title: 'BCS Model Test 4', questionNumber: '50', duration: '30',price: '10 Taka'),
    ];

    if(maps.isNotEmpty){
      return maps;
    }else{
      await addBcs(bcsList);
      return await loadBcs();
    }
  }

}
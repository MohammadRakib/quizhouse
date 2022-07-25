import 'db_repository.dart';

class CategoryRepository{

  Future createCategoryTable() async{
    final db = await DbRepository().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String name = 'name TEXT NOT NULL';
    String imageUri = 'imageUri TEXT NOT NULL';
    String completion = 'completion TEXT NOT NULL';

    String sqlCategory = 'CREATE TABLE IF NOT EXISTS category($id, $name, $imageUri, $completion)';
    db.execute(sqlCategory);
  }

  Future loadCategory() async{

  }

}
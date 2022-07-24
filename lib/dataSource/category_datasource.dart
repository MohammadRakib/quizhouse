import 'datasource.dart';

class CategoryDatasource{

  Future createCategoryTable() async{
    final db = await Datasource().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String name = 'name TEXT NOT NULL';
    String completion = 'completion TEXT NOT NULL';

    String sqlCategory = 'CREATE TABLE IF NOT EXISTS category($id, $name, $completion)';
    db.execute(sqlCategory);
  }

}
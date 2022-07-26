import 'package:quizhouse/models/category_model.dart';

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

  Future addCategory() async{
    final db = await DbRepository().database;
    final List<CategoryModel> categoryList = [
      CategoryModel(name: "Bangladesh", imageUri: "lib/assets/logo/category/bangladesh.png", completion: '0'),
      CategoryModel(name: "World", imageUri: "lib/assets/logo/category/world.png", completion: '0'),
      CategoryModel(name: "Cricket", imageUri: "lib/assets/logo/category/cricket.jpg", completion: '0'),
      CategoryModel(name: "Soccer", imageUri: "lib/assets/logo/category/soccer.jpg", completion: '0'),
      CategoryModel(name: "Animal", imageUri: "lib/assets/logo/category/animal.png", completion: '0'),
    ];

    for(CategoryModel x in categoryList){
      await db.insert('category', x.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> loadCategory() async{
    final db = await DbRepository().database;
    final List<Map<String, dynamic>> maps = await db.query('category');

    if(maps.isNotEmpty){
      return maps;
    }else{
      await addCategory();
      return await loadCategory();
    }
  }

}
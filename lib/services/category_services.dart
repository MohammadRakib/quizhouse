import 'package:quizhouse/models/category_model.dart';
import 'package:quizhouse/repository/category_repository.dart';

class CategoryServices{

  Future<List<CategoryModel>> getCategory() async{
    CategoryRepository categoryRepository = CategoryRepository();
    await categoryRepository.createCategoryTable();
    List<Map<String, dynamic>> maps = await categoryRepository.loadCategory();
    if(maps.isNotEmpty){
      final categoryList = List.generate(maps.length, (i) {
        return CategoryModel(id: maps[i]['id'], name: maps[i]['name'], imageUri: maps[i]['imageUri']
        );
      });
      return categoryList;
    }
    return [];
  }

}
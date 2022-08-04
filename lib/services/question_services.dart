import 'package:quizhouse/models/question_model.dart';
import 'package:quizhouse/repository/question_repository.dart';

class QuestionServices{
  Future createQuestion() async{
    QuestionRepository questionRepository = QuestionRepository();
    await questionRepository.createQuestionTable();
  }

  Future<List<QuestionModel>> getQuestionByCategory(int categoryId) async{
    QuestionRepository questionRepository = QuestionRepository();

    List<Map<String, dynamic>> maps = await questionRepository.loadQuestionByCategory(categoryId);
    if(maps.isNotEmpty){
      final questionList = List.generate(maps.length, (i)
      {
        return QuestionModel(category: maps[i]['category'], categoryId: maps[i]['categoryId'],
            hasImage: maps[i]['hasImage'] == 1? true:false, imageUri: maps[i]['imageUri'],
            question: maps[i]['question'], answer: maps[i]['answer'], option1: maps[i]['option1'],
            option2: maps[i]['option2'], option3: maps[i]['option3'], option4: maps[i]['option4']);
      });
      return questionList;
    }
    return [];
  }

}
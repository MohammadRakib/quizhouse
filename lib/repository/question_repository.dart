import 'package:quizhouse/models/question_model.dart';

import 'db_repository.dart';

class QuestionRepository{
  Future createQuestionTable() async{
    final db = await DbRepository().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String category = 'category TEXT NOT NULL';
    String categoryId = 'categoryId INTEGER NOT NULL';
    String hasImage = 'hasImage BOOLEAN NOT NULL';
    String imageUri = 'imageUri TEXT NULL';
    String question = 'question TEXT NOT NULL';
    String answer = 'answer TEXT NOT NULL';
    String option1 = 'option1 TEXT NOT NULL';
    String option2 = 'option2 TEXT NOT NULL';
    String option3 = 'option3 TEXT NOT NULL';
    String option4 = 'option4 TEXT NOT NULL';
    String fKey = 'CONSTRAINT fk_category FOREIGN KEY (categoryId) REFERENCES category (id)';
    String sqlQuestion = 'CREATE TABLE IF NOT EXISTS question($id, $category, $categoryId, $hasImage, $imageUri, $question, $answer, $option1, $option2, $option3, $option4, $fKey)';
    await db.execute(sqlQuestion);

    final List<Map<String, dynamic>> maps = await db.rawQuery('select 1 from question limit 1');
    if(maps.isEmpty){
      final List<QuestionModel> questionList = [
        // Bangladesh
        QuestionModel(category: 'Bangladesh', categoryId: 1, hasImage: false, imageUri: '', question: 'What is the capital of Bangladesh?',
            answer: 'Dhaka', option1: 'Dhaka', option2: 'Khulna', option3: 'Bogura', option4: 'None of these'),

        QuestionModel(category: 'Bangladesh', categoryId: 1, hasImage: false, imageUri: '', question: 'How many total Districts are there in Bangladesh?',
            answer: '64', option1: '60', option2: '61', option3: '62', option4: '64'),

        QuestionModel(category: 'Bangladesh', categoryId: 1, hasImage: false, imageUri: '', question: 'What is the country calling code for Bangladesh?',
            answer: '+880', option1: '+49', option2: '+230', option3: '+880', option4: '+97'),

        QuestionModel(category: 'Bangladesh', categoryId: 1, hasImage: false, imageUri: '', question: 'What is the official language of Bangladesh?',
            answer: 'Bengali', option1: 'Bengali', option2: 'Urdu', option3: 'Arabic', option4: 'Hindi'),

        QuestionModel(category: 'Bangladesh', categoryId: 1, hasImage: false, imageUri: '', question: 'What is the Internet tld of Bangladesh?',
            answer: '.bd', option1: '.in', option2: '.bd', option3: '.uk', option4: '.us'),

        // World
        QuestionModel(category: 'World', categoryId: 2, hasImage: false, imageUri: '', question: 'Which one is the smallest ocean in the world?',
            answer: 'Arctic', option1: 'Indian', option2: 'Pacific', option3: 'Atlantic', option4: 'Arctic'),

        QuestionModel(category: 'World', categoryId: 2, hasImage: false, imageUri: '', question: 'Which country gifted the \'Statue of Liberty\' to USA in 1886?',
            answer: 'France', option1: 'France', option2: 'Canada', option3: 'Brazil', option4: 'England'),

        QuestionModel(category: 'World', categoryId: 2, hasImage: false, imageUri: '', question: 'Dead Sea is located between which two countries?',
            answer: 'Jordan and Israel', option1: 'Jordan and Sudan', option2: 'Jordan and Israel', option3: 'Turkey and UAE', option4: 'UAE and Egypt'),

        QuestionModel(category: 'World', categoryId: 2, hasImage: false, imageUri: '', question: 'In which ocean \'Bermuda Triangle\' region is located?',
            answer: 'Atlantic', option1: 'Atlantic', option2: 'Indian', option3: 'Pacific', option4: 'Arctic'),

        QuestionModel(category: 'World', categoryId: 2, hasImage: false, imageUri: '', question: 'Which country is known as the \'playground of Europe\'?',
            answer: 'Switzerland', option1: 'Austria', option2: 'Holland', option3: 'Switzerland', option4: 'Italy'),

        // Soccer
        QuestionModel(category: 'Soccer', categoryId: 4, hasImage: false, imageUri: '', question: 'Who is the greatest soccer player, also known as “The King of Soccer”?',
            answer: 'pelé', option1: 'David Beckham', option2: 'pelé', option3: 'Diego Maradona', option4: 'none of the above'),

        QuestionModel(category: 'Soccer', categoryId: 4, hasImage: false, imageUri: '', question: 'How many players in total will be on the field in a typical soccer match?',
            answer: '22', option1: '11', option2: '22', option3: '33', option4: '10'),

        QuestionModel(category: 'Soccer', categoryId: 4, hasImage: false, imageUri: '', question: 'How long does a soccer game last?',
            answer: '90 minutes', option1: '45 minutes', option2: '90 minutes', option3: '120 minutes', option4: '30 minutes'),

        QuestionModel(category: 'Soccer', categoryId: 4, hasImage: false, imageUri: '', question: 'Which player scored the "Hand of God" goal in a match of the 1986 World Cup?',
            answer: 'Diego Maradona', option1: 'Cristiano Ronaldo', option2: 'Lionel Messi', option3: 'Diego Maradona', option4: 'David Beckham'),

        QuestionModel(category: 'Soccer', categoryId: 4, hasImage: false, imageUri: '', question: 'Who can add time in a soccer game?',
            answer: 'Referee', option1: 'Referee', option2: 'Coach', option3: 'Team captain', option4: 'Player'),

        // Cricket
        QuestionModel(category: 'Cricket', categoryId: 3, hasImage: false, imageUri: '', question: 'What is the distance between the popping crease and the bowling crease?',
            answer: '4 feet', option1: '3 feet', option2: '5 feet', option3: '4 feet', option4: '6 feet'),

        QuestionModel(category: 'Cricket', categoryId: 3, hasImage: false, imageUri: '', question: 'The West Indies hit 421 batting first in their warm up match versus who?',
            answer: 'New Zealand', option1: 'India', option2: 'New Zealand', option3: 'Australia', option4: 'England'),

        QuestionModel(category: 'Cricket', categoryId: 3, hasImage: false, imageUri: '', question: 'What was the official name of the first Cricket World Cup?',
            answer: 'Prudential World Cup', option1: 'Prudential World Cup', option2: 'ICC World Cup', option3: 'Cricket World Cup', option4: 'None of the above'),

        QuestionModel(category: 'Cricket', categoryId: 3, hasImage: false, imageUri: '', question: 'What was the prize money of Prudential World Cup for the winner amounted to?',
            answer: '4000 dollars', option1: '2000 dollars', option2: '5000 dollars', option3: '10000 dollars', option4: '4000 dollars'),

        QuestionModel(category: 'Cricket', categoryId: 3, hasImage: false, imageUri: '', question: 'What is the the maximum distance, allowed from pitch to the boundary/ line in first class Indian matches?',
            answer: '75 yards', option1: '60 yards', option2: '75 yards', option3: '50 yards', option4: '40 yards'),

        // Animals
        QuestionModel(category: 'Animals', categoryId: 5, hasImage: false, imageUri: '', question: 'Which is the tallest animal in the world?',
            answer: 'Giraffe', option1: 'Giraffe', option2: 'Elephant', option3: 'Bear', option4: 'Snake'),

        QuestionModel(category: 'Animals', categoryId: 5, hasImage: false, imageUri: '', question: 'Which animal has the longest lifeline?',
            answer: 'The arctic whale', option1: 'Tiger', option2: 'Tortoise', option3: 'The arctic whale', option4: 'Squid'),

        QuestionModel(category: 'Animals', categoryId: 5, hasImage: false, imageUri: '', question: 'How many legs does an octopus have?',
            answer: '8', option1: '10', option2: '8', option3: '7', option4: '6'),

        QuestionModel(category: 'Animals', categoryId: 5, hasImage: false, imageUri: '', question: 'Which animal is Doe?',
            answer: 'A female deer', option1: 'Deer', option2: 'Lion', option3: 'Cat', option4: 'A female deer'),

        QuestionModel(category: 'Animals', categoryId: 5, hasImage: false, imageUri: '', question: 'Which bird is the symbol of peace?',
            answer: 'Dove', option1: 'Dove', option2: 'Parrot', option3: 'Eagle', option4: 'Sparrow'),
      ];

      await addQuestion(questionList);
    }
    
  }

  Future addQuestion(List<QuestionModel> questionList) async{
    final db = await DbRepository().database;

    for(QuestionModel x in questionList){
      await db.insert('question', x.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> loadQuestionByCategory(int categoryId) async{
    final db = await DbRepository().database;
    return await db.rawQuery('select * from question where categoryId == ${categoryId.toString()}');
  }
}
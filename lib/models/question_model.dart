class QuestionModel{

  String category;
  int categoryId;
  bool hasImage;
  String imageUri;
  String question;
  String answer;
  String option1;
  String option2;
  String option3;
  String option4;

  QuestionModel({required this.category, required this.categoryId, required this.hasImage, required this.imageUri, required this.question, required this.answer, required this.option1, required this.option2,
      required this.option3, required this.option4});


  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'categoryId': categoryId,
      'hasImage': hasImage? 1 : 0,
      'imageUri': imageUri,
      'question': question,
      'answer' : answer,
      'option1' : option1,
      'option2' : option2,
      'option3' : option3,
      'option4' : option4
    };
  }

  @override
  String toString() {
    return 'QuestionModel{category: $category, categoryId: $categoryId, hasImage: $hasImage, imageUri: $imageUri, question: $question, answer: $answer, option1: $option1, option2: $option2, option3: $option3, option4: $option4}';
  }
}

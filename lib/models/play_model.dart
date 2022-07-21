class PlayModel{

  int questionNo;
  String title;
  bool hasImage;
  String imageUri;
  String time;
  String question;
  String answer;
  String option1;
  String option2;
  String option3;
  String option4;

  PlayModel({required this.questionNo, required this.title, required this.hasImage, required this.imageUri, required this.time, required this.question, required this.answer, required this.option1, required this.option2,
      required this.option3, required this.option4});

  @override
  String toString() {
    return 'PlayModel{questionNo: $questionNo, title: $title, hasImage: $hasImage, imageUri: $imageUri, time: $time, question: $question, answer: $answer, option1: $option1, option2: $option2, option3: $option3, option4: $option4}';
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizhouse/core/sharedWidgets/Loading.dart';
import 'package:quizhouse/views/result/result_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../core/utils/color.dart';
import '../../viewModels/play/question_view_model.dart';

class PlayView extends StatelessWidget {

  int categoryId;
  PlayView({Key? key, required this.categoryId}) : super(key: key);
  bool isSelect = false;
  bool timerAnimation = true;
  String heroTag = 'resultPopUp';
  int correctAnswerNumber = 0;

  @override
  Widget build(BuildContext context) {

    QuestionViewModel questionViewModel = context.watch<QuestionViewModel>();
    questionViewModel.getQuestionByCategory(categoryId);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    if(questionViewModel.items.isEmpty){
      return Loading();
    }else{

      void onTimerAnimationEnd(){
        isSelect = true;
        if(questionViewModel.items[questionViewModel.questionIndex].option1 == questionViewModel.items[questionViewModel.questionIndex].answer){
          questionViewModel.optionBorderColor1 = 0xFF66BB6A;
        }else if(questionViewModel.items[questionViewModel.questionIndex].option2 == questionViewModel.items[questionViewModel.questionIndex].answer){
          questionViewModel.optionBorderColor2 = 0xFF66BB6A;
        }else if(questionViewModel.items[questionViewModel.questionIndex].option3 == questionViewModel.items[questionViewModel.questionIndex].answer){
          questionViewModel.optionBorderColor3 = 0xFF66BB6A;
        }else{
          questionViewModel.optionBorderColor4 = 0xFF66BB6A;
        }
      }

      List<Widget> timerBars = List.generate(questionViewModel.items.length, (index) => LinearPercentIndicator(
        key: Key('${questionViewModel.questionIndex}'),
        width: MediaQuery.of(context).size.width - 50,
        animation: timerAnimation,
        lineHeight: 20.0,
        animationDuration: questionViewModel.time*1000,
        percent: 1.0,
        barRadius: const Radius.circular(20),
        progressColor: Colors.grey.shade300,
        backgroundColor: const Color(secondaryColor),
        isRTL: true,
        onAnimationEnd: (){
          onTimerAnimationEnd();
        },
      ),);

      void onTapBackButton() {
        showDialog(context: context, builder: (_) => AlertDialog(
          content: Text('do you want to exit the quiz?'),
          actions: [
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: (){
                Navigator.of(context).pop();
                questionViewModel.questionIndex = 0;
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
      }

      return WillPopScope(
        onWillPop: () {
          onTapBackButton();
          return Future.value(false);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30.0),
              color: const Color(appBarColor),
              child: Text(
                  '${questionViewModel.questionIndex + 1} of ${questionViewModel.items.length}'
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 15, 0, 15),
              child: timerBars[questionViewModel.questionIndex],
            ),

            const SizedBox(height: 20,),
            questionViewModel.items[questionViewModel.questionIndex].hasImage? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: orientation == Orientation.portrait? Image.asset(questionViewModel.items[questionViewModel.questionIndex].imageUri,
                height: width/2,
                width: width,
                fit: BoxFit.cover,
              ) : Center(
                child: Image.asset(questionViewModel.items[questionViewModel.questionIndex].imageUri,
                  height: width/4,
                  width: width/3,
                  fit: BoxFit.cover,
                ),
              ),
            ) : const SizedBox(height: 0,),

            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 34.0),
              child: Text(
                questionViewModel.items[questionViewModel.questionIndex].question,
              ),
            ),

            const SizedBox(height: 20,),
            GestureDetector(
              child: Container(
                height: orientation == Orientation.portrait? width/10 : width/17,
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                width: width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(color: Color(questionViewModel.optionBorderColor1)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(questionViewModel.items[questionViewModel.questionIndex].option1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              onTap: (){
                if(!isSelect){
                  isSelect = true;
                  timerAnimation = false;
                  if(questionViewModel.items[questionViewModel.questionIndex].option1 == questionViewModel.items[questionViewModel.questionIndex].answer){
                    questionViewModel.optionBorderColor1 = 0xFF66BB6A;
                    correctAnswerNumber = correctAnswerNumber + 1;
                  }else{
                    questionViewModel.optionBorderColor1 = 0xFFEF5350;
                  }
                }
              },
            ),

            GestureDetector(
              child: Container(
                height: orientation == Orientation.portrait? width/10 : width/17,
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                width: width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(color: Color(questionViewModel.optionBorderColor2)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(questionViewModel.items[questionViewModel.questionIndex].option2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              onTap: (){
                if(!isSelect){
                  isSelect = true;
                  timerAnimation = false;
                  if(questionViewModel.items[questionViewModel.questionIndex].option2 == questionViewModel.items[questionViewModel.questionIndex].answer){
                    questionViewModel.optionBorderColor2 = 0xFF66BB6A;
                    correctAnswerNumber = correctAnswerNumber + 1;
                  }else{
                    questionViewModel.optionBorderColor2 = 0xFFEF5350;
                  }
                }
              },
            ),

            GestureDetector(
              child: Container(
                height: orientation == Orientation.portrait? width/10 : width/17,
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                width: width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(color: Color(questionViewModel.optionBorderColor3)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(questionViewModel.items[questionViewModel.questionIndex].option3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              onTap: (){
                if(!isSelect){
                  isSelect = true;
                  timerAnimation = false;
                  if(questionViewModel.items[questionViewModel.questionIndex].option3 == questionViewModel.items[questionViewModel.questionIndex].answer){
                    questionViewModel.optionBorderColor3 = 0xFF66BB6A;
                    correctAnswerNumber = correctAnswerNumber + 1;
                  }else{
                    questionViewModel.optionBorderColor3 = 0xFFEF5350;
                  }
                }
              },
            ),

            GestureDetector(
              child: Container(
                height: orientation == Orientation.portrait? width/10 : width/17,
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                width: width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(color: Color(questionViewModel.optionBorderColor4)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(questionViewModel.items[questionViewModel.questionIndex].option4,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              onTap: (){
                if(!isSelect){
                  isSelect = true;
                  timerAnimation = false;
                  if(questionViewModel.items[questionViewModel.questionIndex].option4 == questionViewModel.items[questionViewModel.questionIndex].answer){
                    questionViewModel.optionBorderColor4 = 0xFF66BB6A;
                    correctAnswerNumber = correctAnswerNumber + 1;
                  }else{
                    questionViewModel.optionBorderColor4 = 0xFFEF5350;
                  }
                }
              },
            ),
            const SizedBox(height: 10,),

            isSelect? Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: (){

                      if(questionViewModel.questionIndex < questionViewModel.items.length-1){
                        isSelect = false;
                        timerAnimation = true;
                        questionViewModel.questionIndex = questionViewModel.questionIndex + 1;
                        questionViewModel.changeState();
                      }else{
                        questionViewModel.questionIndex = 0;
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ResultView(correctAnswerNumber: correctAnswerNumber)));
                      }
                    },
                    child: const Text(
                      'Next',
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(primaryColor)),
                    ),
                  ),
                ],
              ),
            ) :
            const SizedBox(height: 0,),
          ],
        ),
      );
    }
  }
}

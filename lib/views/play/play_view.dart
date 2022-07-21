import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizhouse/views/result/result_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../core/sharedWidgets/hero_dialog_route.dart';
import '../../core/utils/color.dart';
import '../../viewModels/play/play_view_model.dart';

class PlayView extends StatelessWidget {

  PlayView({Key? key}) : super(key: key);
  bool isSelect = false;
  bool timerAnimation = true;
  String heroTag = 'resultPopUp';

  @override
  Widget build(BuildContext context) {

    PlayViewModel playViewModel = Provider.of<PlayViewModel>(context);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;
    int timer = int.parse(playViewModel.items[playViewModel.questionIndex].time);

    void onTimerAnimationEnd(){
      isSelect = true;
      if(playViewModel.items[playViewModel.questionIndex].option1 == playViewModel.items[playViewModel.questionIndex].answer){
        playViewModel.optionBorderColor1 = 0xFF66BB6A;
      }else if(playViewModel.items[playViewModel.questionIndex].option2 == playViewModel.items[playViewModel.questionIndex].answer){
        playViewModel.optionBorderColor2 = 0xFF66BB6A;
      }else if(playViewModel.items[playViewModel.questionIndex].option3 == playViewModel.items[playViewModel.questionIndex].answer){
        playViewModel.optionBorderColor3 = 0xFF66BB6A;
      }else{
        playViewModel.optionBorderColor4 = 0xFF66BB6A;
      }
    }

    List<Widget> timerBars = List.generate(playViewModel.items.length, (index) => LinearPercentIndicator(
      key: Key('${playViewModel.questionIndex}'),
      width: MediaQuery.of(context).size.width - 50,
      animation: timerAnimation,
      lineHeight: 20.0,
      animationDuration: timer*1000,
      percent: 1.0,
      barRadius: const Radius.circular(20),
      progressColor: Colors.grey.shade300,
      backgroundColor: const Color(secondaryColor),
      isRTL: true,
      onAnimationEnd: (){
        onTimerAnimationEnd();
      },
    ),);


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30.0),
          color: const Color(appBarColor),
          child: Text(
            '${playViewModel.items[playViewModel.questionIndex].questionNo} of ${playViewModel.items.length}'
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
                padding: const EdgeInsets.fromLTRB(22, 15, 0, 15),
                child: timerBars[playViewModel.questionIndex],
          ),

        const SizedBox(height: 20,),
        playViewModel.items[playViewModel.questionIndex].hasImage? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: orientation == Orientation.portrait? Image.asset(playViewModel.items[playViewModel.questionIndex].imageUri,
            height: width/2,
            width: width,
            fit: BoxFit.cover,
          ) : Center(
            child: Image.asset(playViewModel.items[playViewModel.questionIndex].imageUri,
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
              playViewModel.items[playViewModel.questionIndex].question,
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
              border: Border.all(color: Color(playViewModel.optionBorderColor1)),
              color: Colors.white,
            ),
            child: Center(
              child: Text(playViewModel.items[playViewModel.questionIndex].option1,
                textAlign: TextAlign.center,
              ),
            ),
          ),

          onTap: (){
            if(!isSelect){
                isSelect = true;
                timerAnimation = false;
                if(playViewModel.items[playViewModel.questionIndex].option1 == playViewModel.items[playViewModel.questionIndex].answer){
                  playViewModel.optionBorderColor1 = 0xFF66BB6A;
                }else{
                  playViewModel.optionBorderColor1 = 0xFFEF5350;
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
              border: Border.all(color: Color(playViewModel.optionBorderColor2)),
              color: Colors.white,
            ),
            child: Center(
              child: Text(playViewModel.items[playViewModel.questionIndex].option2,
                textAlign: TextAlign.center,
              ),
            ),
          ),

          onTap: (){
            if(!isSelect){
              isSelect = true;
              timerAnimation = false;
              if(playViewModel.items[playViewModel.questionIndex].option2 == playViewModel.items[playViewModel.questionIndex].answer){
                playViewModel.optionBorderColor2 = 0xFF66BB6A;
              }else{
                playViewModel.optionBorderColor2 = 0xFFEF5350;
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
              border: Border.all(color: Color(playViewModel.optionBorderColor3)),
              color: Colors.white,
            ),
            child: Center(
              child: Text(playViewModel.items[playViewModel.questionIndex].option3,
                textAlign: TextAlign.center,
              ),
            ),
          ),

          onTap: (){
            if(!isSelect){
              isSelect = true;
              timerAnimation = false;
              if(playViewModel.items[playViewModel.questionIndex].option3 == playViewModel.items[playViewModel.questionIndex].answer){
                playViewModel.optionBorderColor3 = 0xFF66BB6A;
              }else{
                playViewModel.optionBorderColor3 = 0xFFEF5350;
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
              border: Border.all(color: Color(playViewModel.optionBorderColor4)),
              color: Colors.white,
            ),
            child: Center(
              child: Text(playViewModel.items[playViewModel.questionIndex].option4,
                textAlign: TextAlign.center,
              ),
            ),
          ),

          onTap: (){
            if(!isSelect){
              isSelect = true;
              timerAnimation = false;
              if(playViewModel.items[playViewModel.questionIndex].option4 == playViewModel.items[playViewModel.questionIndex].answer){
                playViewModel.optionBorderColor4 = 0xFF66BB6A;
              }else{
                playViewModel.optionBorderColor4 = 0xFFEF5350;
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

                          if(playViewModel.questionIndex < playViewModel.items.length-1){
                            isSelect = false;
                            timerAnimation = true;
                            playViewModel.questionIndex = playViewModel.questionIndex + 1;
                          }else{
                            Navigator.of(context).push(
                              HeroDialogRoute(
                                builder: (context) => Center(
                                  child: ResultView(heroTag: heroTag,),
                                ), settings: null,
                              ),
                            );
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
    );
  }
}

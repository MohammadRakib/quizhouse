import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/viewModels/user/user_view_model.dart';

class ResultView extends StatelessWidget {

  int correctAnswerNumber;
  ResultView({Key? key, required this.correctAnswerNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: orientation == Orientation.portrait? height/2 : height/1.2,
        width: orientation == Orientation.portrait? width/1.2 : width/2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: orientation == Orientation.portrait? const EdgeInsets.only(top: 30) : const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'lib/assets/icons/party.png',
                  height: orientation == Orientation.portrait? height/3 : height/7,
                  width: orientation == Orientation.portrait? width/3 : width/7,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: orientation == Orientation.portrait? height/33 : height/50,
                  ),
                  child: Text('You have answered $correctAnswerNumber questions correctly!!',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child:  ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: orientation == Orientation.portrait? MaterialStateProperty.all(const Size.fromHeight(40)) : MaterialStateProperty.all(const Size.fromHeight(40)),
                    backgroundColor: MaterialStateProperty.all(const Color(primaryColor)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    )),
                  ),
                  onPressed: (){
                    if(correctAnswerNumber > 0){
                      userViewModel.updateUserExp();
                    }
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text('Done',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

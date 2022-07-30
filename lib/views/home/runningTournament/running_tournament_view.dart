
import 'package:flutter/material.dart';
import 'package:quizhouse/views/home/runningTournament/running_tournament_item_view.dart';
import 'package:provider/provider.dart';
import '../../../viewModels/home/runningTournament/running_tournament_view_model.dart';

class RunningTournamentView extends StatelessWidget {
  const RunningTournamentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    RunningTournamentViewModel runningTournamentViewModel = context.watch<RunningTournamentViewModel>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    // final listSizedBoxHeight;
    //
    // if(width >= 386 && width <= 450){
    //     listSizedBoxHeight = 180;
    // }
    // else if(width < 386 && width >= 295){
    //   listSizedBoxHeight = 150;
    // }
    // else if(width < 295){
    //   listSizedBoxHeight = 120;
    // }
    // else if(width > 450 && width <= 500){
    //   listSizedBoxHeight = 200;
    // }
    // else if(width > 500 && width <= 564){
    //   listSizedBoxHeight = 225;
    // }
    // else if(width > 564 && width <= 630){
    //   listSizedBoxHeight = 120;
    // }
    // else if(width > 630 && width <= 740){
    //   listSizedBoxHeight = 130;
    // }
    // else if(width > 740 && width <= 820){
    //   listSizedBoxHeight = 140;
    // }
    // else if(width > 820 && width <= 880){
    //   listSizedBoxHeight = 160;
    // }
    // else if(width > 880 && width <= 980){
    //   listSizedBoxHeight = 170;
    // }
    // else{
    //   listSizedBoxHeight = 190;
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text('Ongoing Tournament',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          width: width,
          height: height/3,
          // width: width,
          // height: listSizedBoxHeight ,
          child: ListView.builder(
            itemCount: runningTournamentViewModel.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index) => runningTournamentViewModel.runningTournamentItemList[index],
          ),
        ),
      ],
    );
  }
}

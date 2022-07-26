import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/models/category_model.dart';
import 'package:quizhouse/viewModels/home/category/category_view_model.dart';
import 'package:quizhouse/views/appbar/home_appbar_view.dart';
import 'package:quizhouse/views/home/category/category_item_view.dart';
import 'package:quizhouse/views/home/challengeRoom/challenge_room_view.dart';
import 'package:quizhouse/views/home/playerStatus/player_status_view.dart';
import 'package:quizhouse/views/home/runningTournament/running_tournament_view.dart';
import 'package:provider/provider.dart';
import 'bcs/bcs_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  dynamic buildListView(int index, List<CategoryModel> categoryList){
    if(index == 0){

      return PlayerStatusView();

    }else if(index == 1){
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ChallengeRoomView(),
      );
    }else if(index == 2){
      return const Padding(
        padding: EdgeInsets.only(top: 15),
        child: RunningTournamentView(),
      );
    }else if(index == 3){
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: BcsView(),
      );
    }else if(index == 4){
      return const Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
        child: Text('Category',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }else{
      return CategoryItemView(name: categoryList[index-5].name, imageUri: categoryList[index-5].imageUri, completion: categoryList[index-5].completion);
    }
  }

  @override
  Widget build(BuildContext context) {
    CategoryViewModel categoryViewModel = context.watch<CategoryViewModel>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(homeBackGroundColor),
        appBar: HomeAppBarView(height: 61,),
        body: ListView.builder(
          itemCount: 5 + categoryViewModel.items.length,
          itemBuilder: (context,index) =>  buildListView(index,categoryViewModel.items),
        ),
      ),
    );
  }
}

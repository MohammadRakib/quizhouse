import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/models/your_favourite_model.dart';
import 'package:quizhouse/viewModels/yourFavourite/your_favourite_view_model.dart';
import 'package:quizhouse/views/appbar/home_appbar_view.dart';
import 'package:quizhouse/views/home/challengeRoom/challenge_room_view.dart';
import 'package:quizhouse/views/home/playerStatus/player_status_view.dart';
import 'package:quizhouse/views/home/runningTournament/running_tournament_view.dart';
import 'package:quizhouse/views/home/topTopic/top_topics_view.dart';
import 'package:quizhouse/views/yourFavourite/your_favourite_item_view.dart';
import 'package:provider/provider.dart';

import '../../viewModels/wrapper/auth_wrapper_view_model.dart';
import 'bcs/bcs_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  dynamic buildListView(int index, YourFavouriteViewModel yourFavouriteViewModel){
    if(index == 0){

      return const PlayerStatusView();

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
      return const Padding(
        padding: EdgeInsets.only(top: 15),
        child: TopTopicsView(),
      );
    }else if(index == 4){
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: BcsView(),
      );
    }else if(index == 5){
      return const Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
        child: Text('Your Favourite',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }else{
      return YourFavouriteItemView(yourFavouriteModel: yourFavouriteViewModel.items[index - 6],);
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthWrapperViewModel wrapperViewModel = context.watch<AuthWrapperViewModel>();
    YourFavouriteViewModel yourFavouriteViewModel = context.watch<YourFavouriteViewModel>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(homeBackGroundColor),
        appBar: const HomeAppBarView(height: 61,),
        body: ListView.builder(
          itemCount: 6 + yourFavouriteViewModel.items.length,
          itemBuilder: (context,index) =>  buildListView(index,yourFavouriteViewModel),

        ),
      ),
    );
  }
}

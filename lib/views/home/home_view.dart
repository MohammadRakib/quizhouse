import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/repository/question_repository.dart';
import 'package:quizhouse/services/question_services.dart';
import 'package:quizhouse/viewModels/home/category/category_view_model.dart';
import 'package:quizhouse/viewModels/home/home_view_model.dart';
import 'package:quizhouse/viewModels/play/question_view_model.dart';
import 'package:quizhouse/viewModels/user/user_view_model.dart';
import 'package:quizhouse/views/appbar/home_appbar_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  bool initLoading = false;

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    CategoryViewModel categoryViewModel = context.watch<CategoryViewModel>();
    if(!initLoading){
      UserViewModel userViewModel = context.watch<UserViewModel>();
      userViewModel.getCurrentUser(); // loading user data and update in the view
      initLoading = true;
    }

    context.watch<QuestionViewModel>(); // to init question table

    void onTapBackButton() {
      showDialog(context: context, builder: (_) => AlertDialog(
        content: const Text('do you want to exit the app?'),
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
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
        ],
      ));
    }

    return WillPopScope(
      onWillPop: (){
        onTapBackButton();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(homeBackGroundColor),
          appBar: HomeAppBarView(height: 61,),
          body: ListView.builder(
            itemCount: 5 + categoryViewModel.categoryItem.length,
            itemBuilder: (context,index) =>  homeViewModel.buildListView(index,categoryViewModel.categoryItem),
          ),
        ),
      ),
    );
  }
}

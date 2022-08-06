import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/viewModels/auth/auth_view_model.dart';
import 'package:quizhouse/viewModels/home/category/category_view_model.dart';
import 'package:quizhouse/viewModels/home/bcs/bcs_view_model.dart';
import 'package:quizhouse/viewModels/home/challengeRoom/challenge_room_view_model.dart';
import 'package:quizhouse/viewModels/home/home_view_model.dart';
import 'package:quizhouse/viewModels/home/runningTournament/running_tournament_view_model.dart';
import 'package:quizhouse/viewModels/play/question_view_model.dart';
import 'package:quizhouse/viewModels/shop/shop_view_model.dart';
import 'package:quizhouse/viewModels/user/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:quizhouse/views/wrapper/main_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
        ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
        ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
        ChangeNotifierProvider<ChallengeRoomViewModel>(create: (_) => ChallengeRoomViewModel()),
        ChangeNotifierProvider<RunningTournamentViewModel>(create: (_) => RunningTournamentViewModel()),
        ChangeNotifierProvider<BcsViewModel>(create: (_) => BcsViewModel()),
        ChangeNotifierProvider<CategoryViewModel>(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider<ShopVIewModel>(create: (_) => ShopVIewModel()),
        ChangeNotifierProvider<QuestionViewModel>(create: (_) => QuestionViewModel()),
      ],
      child: MaterialApp(
        title: 'Quiz House',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(primaryColor),
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainWrapper(),
        // home: const HomeWrapper(),
      ),
    );
  }
}

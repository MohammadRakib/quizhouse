import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/viewModels/appbar/home_appbar_view_model.dart';
import 'package:quizhouse/viewModels/auth/mobile_register_view_model.dart';
import 'package:quizhouse/viewModels/auth/register_view_model.dart';
import 'package:quizhouse/viewModels/category/category_view_model.dart';
import 'package:quizhouse/viewModels/home/bcs/bcs_view_model.dart';
import 'package:quizhouse/viewModels/home/challengeRoom/challenge_room_view_model.dart';
import 'package:quizhouse/viewModels/home/playerStatus/player_status_view_model.dart';
import 'package:quizhouse/viewModels/home/runningTournament/running_tournament_view_model.dart';
import 'package:quizhouse/viewModels/home/topTopic/top_topics_view_model.dart';
import 'package:quizhouse/viewModels/yourFavourite/your_favourite_view_model.dart';
import 'package:quizhouse/views/category/category_view.dart';
import 'package:quizhouse/views/home/challengeRoom/challenge_room_view.dart';
import 'package:quizhouse/views/home/home_view.dart';
import 'package:quizhouse/views/play/play_view_wrapper.dart';
import 'package:quizhouse/views/wrapper/auth_wrapper.dart';
import 'package:quizhouse/viewModels/auth/login_view_model.dart';
import 'package:quizhouse/viewModels/auth/mobile_login_view_model.dart';
import 'package:quizhouse/viewModels/wrapper/auth_wrapper_view_model.dart';
import 'package:quizhouse/views/wrapper/home_wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<AuthWrapperViewModel>(create: (_) => AuthWrapperViewModel()),
        ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
        ChangeNotifierProvider<RegisterViewModel>(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider<MobileLoginViewModel>(create: (_) => MobileLoginViewModel()),
        ChangeNotifierProvider<MobileRegisterViewModel>(create: (_) => MobileRegisterViewModel()),
        ChangeNotifierProvider<HomeAppBarViewModel>(create: (_) => HomeAppBarViewModel()),
        ChangeNotifierProvider<ChallengeRoomViewModel>(create: (_) => ChallengeRoomViewModel()),
        ChangeNotifierProvider<PlayerStatusViewModel>(create: (_) => PlayerStatusViewModel()),
        ChangeNotifierProvider<RunningTournamentViewModel>(create: (_) => RunningTournamentViewModel()),
        ChangeNotifierProvider<TopTopicsViewModel>(create: (_) => TopTopicsViewModel()),
        ChangeNotifierProvider<BcsViewModel>(create: (_) => BcsViewModel()),
        ChangeNotifierProvider<YourFavouriteViewModel>(create: (_) => YourFavouriteViewModel()),
        ChangeNotifierProvider<CategoryViewModel>(create: (_) => CategoryViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(primaryColor),
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const AuthWrapper(),
        // home: const HomeWrapper(),
      ),
    );
  }
}

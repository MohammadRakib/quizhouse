import 'package:flutter/cupertino.dart';
import 'package:quizhouse/models/user_model.dart';
import 'package:quizhouse/services/auth_services.dart';
import 'package:quizhouse/viewModels/appbar/home_appbar_view_model.dart';
import 'package:quizhouse/viewModels/home/playerStatus/player_status_view_model.dart';

class HomeViewModel extends ChangeNotifier{
  UserModel? _currentUser;
  HomeAppBarViewModel? _homeAppBarViewModel;
  PlayerStatusViewModel? _playerStatusViewModel;

  PlayerStatusViewModel? get playerStatusViewModel => _playerStatusViewModel;

  set playerStatusViewModel(PlayerStatusViewModel? value) {
    _playerStatusViewModel = value;
  }

  HomeAppBarViewModel? get homeAppBarViewModel => _homeAppBarViewModel;

  set homeAppBarViewModel(HomeAppBarViewModel? value) {
    _homeAppBarViewModel = value;
  }

  UserModel? get currentUser => _currentUser;

  set currentUser(UserModel? value) {
    _currentUser = value;
  }

  HomeViewModel(){
    getCurrentUser();
  }

  Future getCurrentUser() async{
     currentUser = await AuthServices().getCurrentUser();
     homeAppBarViewModel = HomeAppBarViewModel(userModel: currentUser);
     playerStatusViewModel = PlayerStatusViewModel(userModel: currentUser);
     notifyListeners();
  }
}
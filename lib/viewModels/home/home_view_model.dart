import 'package:flutter/cupertino.dart';
import 'package:quizhouse/models/user_model.dart';
import 'package:quizhouse/repository/category_repository.dart';
import 'package:quizhouse/services/user_services.dart';
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

  HomeViewModel(){
    getCurrentUser();
  }

  Future getCurrentUser() async{
     _currentUser = await UserServices().getCurrentUser();
     homeAppBarViewModel = HomeAppBarViewModel(userModel: _currentUser);
     playerStatusViewModel = PlayerStatusViewModel(userModel: _currentUser);
     notifyListeners();
  }
}
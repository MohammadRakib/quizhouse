import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/viewModels/appbar/home_appbar_view_model.dart';
import 'package:provider/provider.dart';

import '../../services/auth_services.dart';
import '../../viewModels/home/home_view_model.dart';
import '../../viewModels/wrapper/auth_wrapper_view_model.dart';

class HomeAppBarView extends StatelessWidget implements PreferredSizeWidget{

  final double height;
  const HomeAppBarView({Key? key, this.height = kToolbarHeight,}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    HomeAppBarViewModel homeAppBarViewModel = context.watch<HomeAppBarViewModel>();
    AuthWrapperViewModel wrapperViewModel = context.watch<AuthWrapperViewModel>();
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    if(homeViewModel.currentUser != null){
      homeAppBarViewModel.name = homeViewModel.currentUser!.name;
      homeAppBarViewModel.level = homeViewModel.currentUser!.lvl.toString();
    }
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      height: preferredSize.height,
      color: const Color(appBarColor),
      child: Stack(
        children: [
          const Positioned(
            top: 10,
            left: 10,
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/dummyImage.png'),
              backgroundColor: Color(appBarColor),
            ),
          ),

          Positioned(
            top: 11,
            left: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'hi, ${homeAppBarViewModel.name}',
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Color(appBarTitleColor),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    'your current level is ${homeAppBarViewModel.level}',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Color(appBarSubTitleColor),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 8,
            right: 1,
              child: IconButton(
                  onPressed: () async{
                    if(await AuthServices().logout()){
                      wrapperViewModel.isLogin = false;
                      wrapperViewModel.stateChange();
                    }
                  },
                  icon: const Icon(Icons.logout_rounded,
                    color: Color(primaryColor),
                  ),
              ),
          ),

        ],
      ),
    );
  }
}

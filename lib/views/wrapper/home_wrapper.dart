import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/views/home/home_view.dart';
import 'package:quizhouse/views/maintenance_view.dart';
import 'package:provider/provider.dart';

import '../../viewModels/wrapper/auth_wrapper_view_model.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {

  List<Widget> states = [const MaintenanceView(), const MaintenanceView(), const HomeView(), const MaintenanceView(), const MaintenanceView()];
  int _state = 2;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: states.elementAt(_state),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_rounded),
            label: "Leaderboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_rounded),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_rounded),
            label: "Friends",
          ),
        ],

        selectedItemColor: const Color(selectedItemColor),
        unselectedItemColor: const Color(unselectedItemColor),
        currentIndex: _state,
        selectedIconTheme: const IconThemeData(
          size: 36.0,
        ),
        unselectedIconTheme: const IconThemeData(
          size: 33.0,
        ),

        onTap: (index) {
          setState(() {
            _state = index;
          });
        },
      ),
    );
  }
}

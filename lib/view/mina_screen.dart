import 'package:flutter/material.dart';
import 'package:music_app/view/bottom_screens/account_screen.dart';
import 'package:music_app/view/bottom_screens/favorite_screen.dart';
import 'package:music_app/view/bottom_screens/home_screen.dart';
import 'package:music_app/view/bottom_screens/search_screen.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int screenIndex = 0;
  List _listOfScreens = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SweetNavBar(
        //paddingGradientColor: ,
        currentIndex: screenIndex,
        paddingBackgroundColor: Color(0xff161616),
        backgroundColor: Color(0xff211C2C),
        items: [
          SweetNavBarItem(
              sweetActive: Image.asset('assets/images/bottom_bar/Home 1.png', width: 30, height: 30,),
              sweetIcon: Image.asset('assets/images/bottom_bar/Home 1.png', width: 30, height: 30,),
              sweetLabel: '',
              sweetBackground: Colors.transparent),
          SweetNavBarItem(
              sweetActive: Image.asset('assets/images/bottom_bar/Search 1.png', width: 30, height: 30,),
              sweetIcon: Image.asset('assets/images/bottom_bar/Search 1.png', width: 30, height: 30,),
              sweetLabel: '',
              sweetBackground: Colors.transparent),
          SweetNavBarItem(
              sweetActive: Image.asset('assets/images/bottom_bar/Heart 1.png', width: 30, height: 30,),
              sweetIcon: Image.asset('assets/images/bottom_bar/Heart 1.png', width: 30, height: 30,),
              sweetLabel: '',
              sweetBackground: Colors.transparent),
          SweetNavBarItem(
              sweetActive: Image.asset('assets/images/bottom_bar/Profile 1.png', width: 30, height: 30,),
              sweetIcon: Image.asset('assets/images/bottom_bar/Profile 1.png', width: 30, height: 30,),
              sweetLabel: '',
              sweetBackground: Colors.transparent),
        ],
        onTap: (index) {
          setState(() {
            screenIndex = index;
          });
        },
      ),
      body: _listOfScreens[screenIndex],
    );
  }
}

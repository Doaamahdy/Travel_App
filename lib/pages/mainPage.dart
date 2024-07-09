import 'package:flutter/material.dart';
import 'package:my_app/pages/bartItemPage.dart';
import 'package:my_app/pages/homePage.dart';
import 'package:my_app/pages/myPage.dart';
import 'package:my_app/pages/searchPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List pages = [
    HomePage(),
    BartItemPage(),
    SearchPage(),
    MyPage(),
  ];
  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: "Bar", icon: Icon(Icons.bar_chart_rounded)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "My", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

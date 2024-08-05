// ignore_for_file: unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_final_project/calender.dart';
import 'package:flutter_final_project/categories.dart';
import 'package:flutter_final_project/home.dart';
import 'package:flutter_final_project/profile.dart';
class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

    PageController _pageController = PageController();
  List<Widget> _screens = [
    HomePage(), ProggressScreen(), CalendarScreen(),ProfileScreen()
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int _selectedIndex){
    _pageController.jumpToPage(_selectedIndex);
  }
  @override
  Widget build(BuildContext context) {
    Color color = Colors.pink;
    Color icons_color = Colors.white;
    double icon_size = 35;

    return  Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: _onItemTapped,
        color: Colors.black,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        height: 70,
        items: [
          //home
        Icon(Icons.home, color: icons_color, size: icon_size,),
        //proggress
        Icon(Icons.bar_chart, color: icons_color, size: icon_size,),
        //calender
        Icon(Icons.calendar_month, color: icons_color, size: icon_size,),
        //profile
        Icon(Icons.person, color: icons_color, size: icon_size,)
      ]),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
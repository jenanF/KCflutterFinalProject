// ignore_for_file: unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
    HomePage(), CategoriesScreen(),ProfileScreen()
  ];
  void _onPageChanged(int index){

  }
  @override
  Widget build(BuildContext context) {
    Color color = Colors.pink;
    Color icons_color = Colors.white;
    double icon_size = 35;

    return  Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        height: 70,
        items: [
        Icon(Icons.home, color: icons_color, size: icon_size,),
        Icon(Icons.apps, color: icons_color, size: icon_size,),
        Icon(Icons.person, color: icons_color, size: icon_size,)
      ]),
    );
  }
}
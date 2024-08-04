import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "jenan";
    Color color = Colors.pink;
    return  Scaffold(
      body: Center(
        child: Column(children: [
          Container(child: Row(children: [
            Text("Hello $name",
            style: TextStyle(color: color),)

          ],),)
        ],)),
    );
  }
}
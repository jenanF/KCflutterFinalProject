// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_final_project/progress.dart';
import 'package:flutter_final_project/profile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   DateTime today = DateTime.now();

  @override

  Widget build(BuildContext context) {

    String name = "name";
    Color color = Colors.pink;
    Color icons_color = Colors.white;
    double icon_size = 35;

    return  Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 60,
       flexibleSpace: Center(
        child: Image.asset(
            'assets/images/white.png', 
             width: 70,
            height: 70,
          ),
      ),),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(child: Row(children: [
              Text("Hello $name..",
              style: TextStyle(
                color: color,
                fontSize: 30,
                fontWeight: FontWeight.w800),),

                Spacer(),

                Stack(
                  children:[ IconButton(onPressed: (){}, 
                  icon: Icon(Icons.bolt_sharp,color: color,size: 30,)),
                  Icon(Icons.circle_outlined, size: 45,color: color,)
            ]),
            
            ],),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text( DateFormat('EEEE, d MMM yyyy').format(today),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500
              ),)),
          ),
          
           ]
        )),
    );
  }
}
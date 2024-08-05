// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';

import 'package:flutter_final_project/categories.dart';
import 'package:flutter_final_project/profile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    
  


  @override

  Widget build(BuildContext context) {

    

    String name = "jenan";
    Color color = Colors.pink;
    Color icons_color = Colors.white;
    double icon_size = 35;

    return  Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.black,
      flexibleSpace: Image.asset(
          'assets/images/white.png', 

          fit: BoxFit.cover,
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
           ]
        )),
    );
  }
}
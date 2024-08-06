// ignore_for_file: unused_import, unused_local_variable

//import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_final_project/help.dart';
import 'package:flutter_final_project/models/cards_habits.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_final_project/progress.dart';
import 'package:flutter_final_project/profile.dart';
import 'package:percent_indicator/percent_indicator.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   DateTime today = DateTime.now();
   double progress = 0.75;

   List habits = [
    // name , bool, time, goal
    ["Reading", false, 2, 10],
    ["Coding", false, 2, 10],
    ["Running", false, 2, 10],
    ["Homework", false, 2, 10]
   ];

   void TaskStarted(int index){
    var startTime = DateTime.now();
    int Etime = habits[index][2];

    setState(() {
      habits[index][1] = ! habits[index][1];
    });
    if(habits[index][1]){
    Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        if(habits[index][1] == false){
          timer.cancel();
        }
        var currentTime = DateTime.now();
        habits[index][2] = Etime + currentTime.second - startTime.second + 
         60 * (currentTime.minute - startTime.minute) +
         60 * 60 * (currentTime.hour - startTime.hour);
      });
    });
    }
   }

  @override

  Widget build(BuildContext context) {

    String name = "name";
    Color color = Colors.pink;
    Color icons_color = Colors.white;
    double icon_size = 35;
    double task_icon_size = 30;

    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 65,
         flexibleSpace: Center(
          child: Image.asset(
              'assets/images/white.png', 
               width: 70,
              height: 70,
            ),
        ),),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Container(child: Row(children: [
                  Text("Hello $name..",
                  style: TextStyle(
                    color: color,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),),
          
                    Spacer(),
          
                    InkWell(onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HelpScreen();
                    }));
                  },
                      child: Stack(
                        children:[ IconButton(onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HelpScreen();
                      }));
                                        },
                        icon: Icon(Icons.bolt_sharp,color: color,size: 30,)),
                        Icon(Icons.circle_outlined, size: 45,color: color,)
                                      ]),
                    ),
                
                ],),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 5),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text( DateFormat('EEEE, d MMM yyyy').format(today),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 1,color: Colors.grey,),
              ),
              Container(alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 7),
                  child: Text("keep going!"),
                )),
              Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:8.0, right: 8, top: 4),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 26,
                color: color,
                borderRadius: BorderRadius.circular(30),
                backgroundColor: Colors.grey[300],),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
          ],),
      
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Stack(
              children:[SizedBox( height: 507,
                child: ListView.builder( itemCount: 4,itemBuilder: (context, index){
                  return  CardsHabits(onTap: (){TaskStarted(index);}, settings: (){},
                   timeSpent: habits[index][2], 
                   timeGoal: habits[index][3], 
                   habitStarted: habits[index][1], 
                   habit: habits[index][0],);
                }),
              ),
              Padding(
             padding: const EdgeInsets.only(top:470 ,right: 26),
             child: Container(alignment: Alignment.bottomRight,
               child: Transform.scale( scale: 1.6,
                 child: ElevatedButton(onPressed: (){}, child: Text("+", style: TextStyle(color: Colors.white, fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                            backgroundColor: color,
                            shape: CircleBorder()
                        ),),
               ),
             ),
           )
            ]),
          )
      
         
      
          //  Padding(
          //    padding: const EdgeInsets.only(top: 35, left: 12, right: 12),
          //    child: Container(
          //     padding: EdgeInsets.all(15),
          //     child: Row(children: [
          //       Stack( alignment: Alignment.center,
          //         children: [ CircularPercentIndicator(
          //           radius: 25,
          //           percent: 0.6,
          //           progressColor: color,
          //         ),
          //         Icon(Icons.play_arrow, color: Colors.black,)]
          //       ),
          //       SizedBox(width: 12,),
          //       Column( 
          //         children: [
          //           Text("Task", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
          //           Text("2:00 / 10 = 20%")
          //         ],
          //       ),
          //       Spacer(),
          //       Icon(Icons.check_box, size: task_icon_size, color: color,),
          //       SizedBox(width: 10,),
          //       Icon(Icons.settings, size: task_icon_size, color: Colors.black,),
          //     ],),
          //     height: 90,
          //     width: 400,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(14),
          //       border: Border.all(
          //       color: Colors.black,
          //       width: 3,
          // ),), ),
          //  ),
           
          // , Padding(
          //    padding: const EdgeInsets.only(right: 20),
          //    child: Container(alignment: Alignment.bottomRight,
          //      child: Transform.scale( scale: 1.6,
          //        child: ElevatedButton(onPressed: (){}, child: Text("+", style: TextStyle(color: Colors.white, fontSize: 20),),
          //         style: ElevatedButton.styleFrom(
          //                   backgroundColor: color,
          //                   shape: CircleBorder()
          //               ),),
          //      ),
          //    ),
          //  )
              
               ]
            )),
        ),
      ),
    );
  }
}

 Widget buildSection(String title, double progress) {
    return Container(
      padding: EdgeInsets.only(top: 16.0, bottom: 16, right: 20, left: 220),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              title,
              style:TextStyle(fontWeight: FontWeight.bold),),
          ),
          LinearProgressIndicator(
            value: progress,
            minHeight: 14,
            borderRadius: BorderRadius.circular(50),
             // Adjust height as needed
          ),
          Container(color: Colors.deepPurpleAccent,height: 100,width: 150,)
          // Add checkboxes or other content here
          
        ],
      ),
    );
  }

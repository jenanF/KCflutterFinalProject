// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
class CardsHabits extends StatelessWidget {

  final String habit;
  final VoidCallback onTap;
  final VoidCallback settings;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;

  const CardsHabits({super.key,
    
    required this.habit,
    required this.onTap,
    required this.settings,
    required this.timeSpent,
    required this.timeGoal,
    required this.habitStarted,});

    String TimerFormat(int Tseconds){
      String sec = (Tseconds % 60).toString();
      String min = (Tseconds / 60).toStringAsFixed(1);

      if (sec.length == 1){
        sec = '0' + sec;
      }

      if (min[1] == '.') {
        min = min.substring(0, 1);
      }
      return min + ':' + sec;
    }

       double percentDone(){
    return timeSpent / (timeGoal * 60);
   }

  @override
  Widget build(BuildContext context) {
    Color color = Colors.pink;
    Color icons_color = Colors.white;
    double icon_size = 35;
    double task_icon_size = 30;

    return  Padding(
           padding: const EdgeInsets.only(top: 17, left: 12, right: 12),
           child: Container(
            padding: EdgeInsets.all(15),
            child: Row(children: [
              Stack( alignment: Alignment.center,
                children: [ CircularPercentIndicator(
                  radius: 25,
                  percent: percentDone(),
                  progressColor: color,
                ),
                GestureDetector(
                  onTap: onTap
                  ,child: Icon( habitStarted ? Icons.pause : Icons.play_arrow, color: Colors.black,))]
              ),
              SizedBox(width: 12,),
              Column( 
                children: [
                  Text(habit, style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
                  Text(TimerFormat(timeSpent) + " / " + timeGoal.toString() + 
                    " = " + (percentDone() * 100).toStringAsFixed(0) + "%")
                ],
              ),
              Spacer(),
              Icon(Icons.check_box, size: task_icon_size, color: color,),
              SizedBox(width: 10,),
              GestureDetector(
                onTap: settings
                ,child: Icon(Icons.settings, size: task_icon_size, color: Colors.black,)),
            ],),
            height: 90,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
              color: Colors.black,
              width: 3,
        ),), ),
         );
  }
}
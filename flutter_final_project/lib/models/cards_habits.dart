// ignore_for_file: unused_local_variable, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_final_project/Habit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_final_project/home.dart';

class CardsHabits extends StatefulWidget {
  final String habit;
  final VoidCallback onTap;
  final VoidCallback settings;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;
  final VoidCallback Checked;
  final bool? isChecked;
  // final Checkbox isChecked;
  final Habit habitObj;

  const CardsHabits(
      {super.key,
      required this.habit,
      required this.onTap,
      required this.settings,
      required this.timeSpent,
      required this.timeGoal,
      required this.habitStarted,
      required this.Checked,
      required this.isChecked,
      required this.habitObj});

  @override
  State<CardsHabits> createState() => _CardsHabitsState();
}

class _CardsHabitsState extends State<CardsHabits> {
  //bool? isChecked = false;

  String TimerFormat(int Tseconds) {
    String sec = (Tseconds % 60).toString();
    String min = (Tseconds / 60).toStringAsFixed(1);

    if (sec.length == 1) {
      sec = '0' + sec;
    }

    if (min[1] == '.') {
      min = min.substring(0, 1);
    }
    return min + ':' + sec;
  }

  double percentDone() {
    return widget.habitObj.timeSpent / (widget.habitObj.timeGoal * 60);
  }

  @override
  Widget build(BuildContext context) {
    Color color = Colors.pink;
    Color icons_color = Colors.white;
    double icon_size = 35;
    double task_icon_size = 30;

    return Padding(
      padding: const EdgeInsets.only(top: 17, left: 12, right: 12),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Stack(alignment: Alignment.center, children: [
              CircularPercentIndicator(
                radius: 25,
                percent: percentDone() < 1 ? percentDone() : 1,
                progressColor: color,
              ),
              GestureDetector(
                  onTap: widget.onTap,
                  child: Icon(
                    widget.habitObj.isPaused ? Icons.pause : Icons.play_arrow,
                    color: Colors.black,
                  ))
            ]),
            SizedBox(
              width: 12,
            ),
            Column(
              children: [
                Text(
                  widget.habitObj.name,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                ),
                Text(TimerFormat(widget.habitObj.timeSpent) +
                    " / " +
                    widget.habitObj.timeGoal.toString() +
                    " = " +
                    (percentDone() * 100).toStringAsFixed(0) +
                    "%")
              ],
            ),
            Spacer(),

            //Checkbox(widget.isChecked),
            // isChecked(),

            Checkbox(
                value: widget.habitObj.isDone,
                activeColor: color,
                onChanged: (newBool) {
                  setState(() {
                    widget.Checked();
                  });
                }),

            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: widget.settings,
                child: Icon(
                  Icons.settings,
                  size: task_icon_size,
                  color: Colors.black,
                )),
          ],
        ),
        height: 90,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
        ),
      ),
    );
  }
}

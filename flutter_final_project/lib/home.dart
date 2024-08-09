// ignore_for_file: unused_import, unused_local_variable

//import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/Habit.dart';
import 'package:flutter_final_project/help.dart';
import 'package:flutter_final_project/models/cards_habits.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_final_project/progress.dart';
import 'package:flutter_final_project/profile.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime today = DateTime.now();
  double progress = 0.75;
  Duration selected_time = Duration(minutes: 0, seconds: 0);

  List habits = [
    // name , bool, time, goal
    ["Reading", false, 2, 3, false],
    ["Coding", false, 2, 4, false],
    ["Running", false, 2, 10, false],
    ["Homework", false, 2, 2, false]
  ];
  List<Habit> habitsList = [
    Habit(
        isDone: false,
        name: "Homework",
        timeGoal: 10,
        timeSpent: 0,
        isPaused: false),
    Habit(
        isDone: false,
        name: "Reading",
        timeGoal: 10,
        timeSpent: 0,
        isPaused: false),
    Habit(
        isDone: false,
        name: "Coding",
        timeGoal: 10,
        timeSpent: 0,
        isPaused: false)
  ];

  bool? check = false;

  void TaskStarted(int index) {
    var startTime = DateTime.now();
    int Etime = habitsList[index].timeSpent;

    setState(() {
      habitsList[index].isPaused = !habitsList[index].isPaused;
    });
    if (habitsList[index].isPaused == true) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (habitsList[index].isPaused == false
              // || habitsList[index].timeSpent == habitsList[index].timeGoal
              ) {
            timer.cancel();
          }
          // else if(habits[index][2].minutes == habits[index][3]){
          //   habits[index][1] = false;
          //   timer.cancel();
          // }
          var currentTime = DateTime.now();
          habitsList[index].timeSpent =
              Etime + //time spent already before paused
                  currentTime.second -
                  startTime.second +
                  60 * (currentTime.minute - startTime.minute) +
                  60 * 60 * (currentTime.hour - startTime.hour);
        });
      });
    }
  }

  final TaskController = TextEditingController();

  void addTask(String task) {
    // habits.add([task, false, 0, 10]);
    habitsList.add(Habit(
        isDone: false,
        name: task,
        timeGoal: 10,
        timeSpent: 0,
        isPaused: false));
  }

  void addTaskPop(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Add Task: ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            alignment: Alignment.center,
            content: Container(
              height: 120,
              width: 200,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Task",
                    ),
                    controller: TaskController,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          "cancel",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[400],
                            fixedSize: Size(93, 25)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            addTask(TaskController.text);
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          "add",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: Size(90, 25)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  void settingsTaped(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Set Timer for " + habitsList[index].name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            content: Container(
              height: 180,
              width: 250,
              child: Column(
                children: [
                  Expanded(
                    child: CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.ms,
                      initialTimerDuration: selected_time,
                      onTimerDurationChanged: (Duration duration) {
                        setState(() {
                          selected_time = duration;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              habitsList[index].timeGoal =
                                  selected_time.inMinutes;
                              Navigator.of(context).pop();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              fixedSize: Size(140, 45)),
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            var removedHabit = habitsList[index];
                            setState(() {
                              habitsList.removeAt(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Task ${habitsList[index].name} was deleted',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    textColor: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        habitsList.insert(index, removedHabit);
                                      });
                                    },
                                  ),
                                  duration: Duration(seconds: 5),
                                  backgroundColor: Colors.grey,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              Navigator.of(context).pop();
                            });
                          },
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                            size: 38,
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  double counter = 0;

  void isChecked1(list, Habit habitObj) {
    var lastElementPosition = list.length - 1;

    var temp = [];
    for (var i in list) {
      if (i == list[lastElementPosition]) {
        temp.add(!i);
      } else {
        temp.add(i);
      }
    }
    setState(() {
      habitObj.isDone = !habitObj.isDone;
      if (habitObj.isDone == true) {
        counter++;
      } else {
        counter--;
      }
    });

    // var x = bool != habits[index][4];
    list = temp;
  }

  @override
  Widget build(BuildContext context) {
    String name = "name";
    Color color = Colors.pink;
    Color icons_color = Colors.white;
    double icon_size = 35;
    double task_icon_size = 30;
    double test = (counter / habitsList.length);

    return SafeArea(
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
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Hello $name..",
                      style: TextStyle(
                          color: color,
                          fontSize: 30,
                          fontWeight: FontWeight.w800),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HelpScreen();
                        }));
                      },
                      child: Stack(children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return HelpScreen();
                              }));
                            },
                            icon: Icon(
                              Icons.bolt_sharp,
                              color: color,
                              size: 30,
                            )),
                        Icon(
                          Icons.circle_outlined,
                          size: 45,
                          color: color,
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 5),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    DateFormat('EEEE, d MMM yyyy').format(today),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 7),
                  child: Text("keep going!"),
                )),
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4),
                  child: LinearProgressIndicator(
                    value: (counter / habitsList.length),
                    minHeight: 26,
                    color: color,
                    borderRadius: BorderRadius.circular(30),
                    backgroundColor: Colors.grey[500],
                  ),
                ),
                Text(
                  '${(test * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Stack(children: [
                SizedBox(
                  height: 507,
                  child: ListView.builder(
                      itemCount: habitsList.length,
                      itemBuilder: (context, index) {
                        return CardsHabits(
                          onTap: () {
                            TaskStarted(index);
                          },
                          settings: () {
                            settingsTaped(index);
                          },
                          timeSpent: habitsList[index].timeSpent,
                          timeGoal: habitsList[index].timeGoal,
                          habitStarted: habitsList[index].isPaused,
                          habit: habitsList[index].name,
                          Checked: () {
                            isChecked1(habits[index], habitsList[index]);
                          },
                          isChecked: check,
                          habitObj: habitsList[index],
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 470, right: 26),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Transform.scale(
                      scale: 1.6,
                      child: ElevatedButton(
                        child: Text(
                          "+",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: color, shape: CircleBorder()),
                        onPressed: () {
                          addTaskPop(context);
                          //print(habits[1][4]);
                        },
                      ),
                    ),
                  ),
                )
              ]),
            )
          ])),
        ),
      ),
    );
  }
}

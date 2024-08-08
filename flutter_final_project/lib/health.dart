// ignore_for_file: unused_import

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_final_project/bmi_calc.dart';
import 'package:flutter_final_project/models/cards_health.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreen();
}

class _HealthScreen extends State<HealthScreen> {
  List drop = [
    "drop",
    "drop",
    "drop",
    "drop",
    "drop",
    "drop",
    "drop",
    "drop",
  ];
  List isDropful = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  double counter = 0;
  int cupCount = 0;

  void dropCheck(index) {
    isDropful[index] = !isDropful[index];
    drop[index] = isDropful[index] ? "dropful" : "drop";

    if (isDropful[index] == true) {
      counter++;
      cupCount++;
    } else {
      counter--;
      cupCount--;
    }
  }

  @override
  Widget build(BuildContext context) {
    double card_height = 200;
    double card_width = 350;
    double test2 = (counter / isDropful.length);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 65,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Center(
          child: Image.asset(
            'assets/images/white.png',
            width: 70,
            height: 70,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text("Health",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 35,
                    fontWeight: FontWeight.w800)),
            Text("Stronger than yesterday"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 20, bottom: 5, right: 2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.water_drop,
                            size: 30,
                            color: Colors.lightBlue,
                          ),
                          Text(
                            "  Water Tracker",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text("Cups  $cupCount / 8"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: Colors.black, width: 2)),
                      height: card_height,
                      width: card_width,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: LinearProgressIndicator(
                                  minHeight: 18,
                                  backgroundColor: Colors.grey[500],
                                  borderRadius: BorderRadius.circular(30),
                                  value: (counter / isDropful.length)
                                      .clamp(0.0, 1.0),
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Text(
                                "${(test2 * 100).toStringAsFixed(0)}%"
                                //'${(test * 100).toStringAsFixed(0)}%'
                                ,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    dropCheck(0);

                                    print(drop);
                                  });
                                },
                                child: Image.asset(
                                  "assets/images/${drop[0]}.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    dropCheck(1);
                                  });
                                },
                                child: Image.asset(
                                  "assets/images/${drop[1]}.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    dropCheck(2);
                                  });
                                },
                                child: Image.asset(
                                  "assets/images/${drop[2]}.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    dropCheck(3);
                                  });
                                },
                                child: Image.asset(
                                  "assets/images/${drop[3]}.png",
                                  height: 40,
                                  width: 40,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    dropCheck(4);
                                  });
                                },
                                child: Image.asset(
                                  "assets/images/${drop[4]}.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    dropCheck(5);
                                  });
                                },
                                child: Image.asset(
                                  "assets/images/${drop[5]}.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    dropCheck(6);
                                  });
                                },
                                child: Image.asset(
                                  "assets/images/${drop[6]}.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    dropCheck(7);
                                  });
                                },
                                child: Image.asset(
                                  "assets/images/${drop[7]}.png",
                                  height: 40,
                                  width: 40,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20).copyWith(top: 10),
              child: Container(
                child: Row(
                  children: [
                    // Container(
                    //   alignment: Alignment.topLeft,
                    //   padding: EdgeInsets.only(left: 20, bottom: 5, right: 50),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       Icon(
                    //         Icons.directions_walk_outlined,
                    //         size: 30,
                    //       ),
                    //       Text(
                    //         " Steps",
                    //         style: TextStyle(
                    //             fontSize: 22, fontWeight: FontWeight.bold),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: Colors.black, width: 3)),
                      height: 200,
                      width: 175,
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                            left: 20, bottom: 5, right: 30, top: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.directions_walk_outlined,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                Text(
                                  " Steps",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "7,400 / 10,000  ",
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(30)
                                      .copyWith(left: 43),
                                  child: Transform.scale(
                                      scale: 1.8,
                                      child: CircularPercentIndicator(
                                        radius: 30,
                                        progressColor: Colors.green,
                                        percent: 7400 / 10000,
                                        animateFromLastPercent: true,
                                      )),
                                ),
                                Text(
                                  "    74%",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BmiCaculator();
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: Colors.black, width: 3)),
                        height: 200,
                        width: 170,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                              left: 20, bottom: 5, right: 30, top: 10),
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Icon(
                                  //   Icons.fitness_center,
                                  //   size: 24,
                                  // ),
                                  Text(
                                    " BMI \nCalculater",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0)
                                        .copyWith(left: 17),
                                    child: Image.asset(
                                      "assets/images/bmi.png",
                                      height: 100,
                                      width: 100,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

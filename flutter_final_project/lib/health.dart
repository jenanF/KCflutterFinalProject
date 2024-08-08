// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_final_project/models/cards_health.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreen();
}

class _HealthScreen extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    Color border_color = Colors.indigoAccent;
    double card_height = 200;
    double card_width = 350;

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
                    fontSize: 30,
                    fontWeight: FontWeight.w800)),
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
                            Icons.directions_walk_outlined,
                            size: 30,
                          ),
                          Text(
                            "  Water Tracker",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: border_color, width: 2)),
                      height: card_height,
                      width: card_width,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
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
                          border: Border.all(
                              color: const Color.fromARGB(255, 244, 75, 131),
                              width: 3)),
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
                                ),
                                Text(
                                  " Steps",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
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

                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                              color: const Color.fromARGB(255, 244, 75, 131),
                              width: 3)),
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
                                      fontWeight: FontWeight.bold),
                                ),

                                Image.asset("assets/images/bmi.png")
                              ],
                            ),
                          ],
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

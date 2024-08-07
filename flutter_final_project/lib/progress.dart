import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double category_height = 180;
    double category_width = 170;

    return Scaffold(
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
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Spacer(),
            Text("Improvments",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.w800)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: category_height,
                  width: category_width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 230, 248, 211)),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/healthred.png"),
                      Text(
                        "Health",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: category_height,
                  width: category_width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 255, 254, 189)),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/mental.png"),
                      Text("Mental",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: category_height,
                  width: category_width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 238, 221, 245)),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/work.png"),
                      Text(
                        "Work",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: category_height,
                  width: category_width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 201, 236, 254)),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/creativity.png"),
                      Text("Get Inspired",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
          ],
        ),
      )),
    );
  }
}

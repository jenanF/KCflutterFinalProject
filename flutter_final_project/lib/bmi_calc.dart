import 'package:flutter/material.dart';

class BmiCaculator extends StatefulWidget {
  const BmiCaculator({super.key});

  @override
  State<BmiCaculator> createState() => _BmiCaculatorState();
}

class _BmiCaculatorState extends State<BmiCaculator> {
  @override
  Widget build(BuildContext context) {
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
            child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Text("BMI Calcutator",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 35,
                  fontWeight: FontWeight.w800)),
        ])));
  }
}

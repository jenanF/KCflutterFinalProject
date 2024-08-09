import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/link.dart';

class BmiCaculator extends StatefulWidget {
  const BmiCaculator({super.key});

  @override
  State<BmiCaculator> createState() => _BmiCaculatorState();
}

class _BmiCaculatorState extends State<BmiCaculator> {
  final weightController = TextEditingController();
  final HeightController = TextEditingController();
  double result = 0;
  Color bmi_color = Colors.black;
  String bmi = "";
  String url = "";
  Color color = Color.fromARGB(255, 231, 230, 230);

  void calculateBMI() {
    double height = double.parse(HeightController.text) / 100;
    double weight = double.parse(weightController.text);
    result = weight / (height * height);
    if (result < 18) {
      bmi_color = const Color.fromARGB(255, 183, 165, 1);
      bmi = "UderWeight!";
      url = "https://www.healthline.com/nutrition/how-to-gain-weight";
      color = const Color.fromARGB(255, 203, 184, 11);
    } else if (result >= 19 && result <= 25) {
      bmi_color = Colors.green;
      bmi = "Healthy Weight";
      url =
          "https://reverehealth.com/live-better/tips-to-maintain-a-healthy-weight/";
      color = Colors.green;
    } else {
      bmi_color = Colors.red;
      bmi = "OverWeight!";
      url = "https://www.healthline.com/health/how-to-prevent-obesity";
      color = Colors.red;
    }
  }

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
          Spacer(),
          Text("BMI Calcutator",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 35,
                  fontWeight: FontWeight.w800)),
          Padding(
            padding: const EdgeInsets.all(12).copyWith(top: 20),
            child: Image.asset(
              "assets/images/bmi.png",
              height: 125,
              width: 125,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(80).copyWith(top: 40, bottom: 0),
            child: TextField(
              controller: weightController,
              decoration: InputDecoration(
                hintText: "Enter Your Weight in KG",
                hintStyle: TextStyle(fontSize: 15),
                contentPadding: EdgeInsets.only(top: 1.3),
                labelText: "Weight in KG",
                labelStyle: TextStyle(fontSize: 18),
                focusColor: Colors.pink,
                prefixIcon: Icon(
                  Icons.monitor_weight,
                  color: Colors.pink,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(80).copyWith(top: 20, bottom: 22),
            child: TextField(
              controller: HeightController,
              decoration: InputDecoration(
                hintText: "Enter Your Height in CM",
                hintStyle: TextStyle(fontSize: 15),
                contentPadding: EdgeInsets.only(top: 1.3),
                labelText: "Height in CM",
                labelStyle: TextStyle(fontSize: 18),
                focusColor: Colors.pink,
                prefixIcon: Icon(
                  Icons.height,
                  color: Colors.pink,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Transform.scale(
            scale: 1.15,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  calculateBMI();
                });
              },
              child: Text(
                "Calcutate",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30).copyWith(left: 40, bottom: 20),
            child: Text(
              "Your BMI : \n ${result.toStringAsFixed(2)}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "  $bmi",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: bmi_color,
              fontWeight: FontWeight.w700,
            ),
          ),
          Link(
              uri: Uri.parse(
                  "https://www.healthline.com/nutrition/how-to-gain-weight"),
              target: LinkTarget.blank,
              builder: (context, followLink) {
                return Padding(
                  padding: const EdgeInsets.all(8.0).copyWith(left: 20),
                  child: Transform.scale(
                    scale: 1.2,
                    child: ElevatedButton(
                      onPressed: followLink,
                      child: const Text(
                        "Suggestions",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                      ),
                    ),
                  ),
                );
              }),
          Spacer()
        ])));
  }
}

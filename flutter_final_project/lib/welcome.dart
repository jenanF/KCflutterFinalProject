import 'package:flutter/material.dart';
import 'package:flutter_final_project/login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(245, 255, 255, 255),
      body: Center(
        child: Stack(children: [
          PageView(children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Spacer(),
              Text("Welcome To",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 38,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 35,),
              Image.asset("assets/images/welcomelogo.gif",
              height: 400,
              width: 400,),
              SizedBox(height: 17,),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                
                child: Text("welcome to BetterMe, become the better version of yourself",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                   ),),
              ),
               Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 28,bottom: 70),
                child: Container(alignment: Alignment.bottomRight,
                  child: Icon(Icons.arrow_forward_ios_sharp,
                  color: Colors.pink,
                  size: 50,),
                ),
              )
                
            ],),
            Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(alignment: Alignment.topLeft,
                  child: Text("Be \nProductive",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 40,
                    fontWeight: FontWeight.w700
                  ),),
                ),
              ),
              SizedBox(height: 15,),
              Image.asset("assets/images/working.png",
              height: 400,
              width: 400,),
              SizedBox(height: 15,),
              Text("get work done and be productive",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                  fontSize: 17,
                  fontWeight: FontWeight.w200
              ),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 28,bottom: 70),
                child: Container(alignment: Alignment.bottomRight,
                  child: Icon(Icons.arrow_forward_ios_sharp,
                  color: Colors.pink,
                  size: 50,),
                ),
              )
            ],),
             Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(alignment: Alignment.topLeft,
                  child: Text("Be \nHealthy",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 40,
                    fontWeight: FontWeight.w700
                  ),),
                ),
              ),
              SizedBox(height: 15,),
              Image.asset("assets/images/healthy.png",
              height: 400,
              width: 400,),
              SizedBox(height: 15,),
              Text("be active and eat healthy",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                  fontSize: 17,
                  fontWeight: FontWeight.w200
              ),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 28,bottom: 70),
                child: Container(alignment: Alignment.bottomRight,
                  child: Icon(Icons.arrow_forward_ios_sharp,
                  color: Colors.pink,
                  size: 50,),
                ),
              )
            ],),
            Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Text("Time Manegmet",
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  
                ),),
              ),
              SizedBox(height: 15,),
              Image.asset("assets/images/times.png",
              height: 400,
              width: 400,),
              SizedBox(height: 15,),
              Text("mange your time and plan your day in the best way",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                  fontSize: 17,
                  fontWeight: FontWeight.w200
              ),),
              Spacer(),
             Container(
              padding: EdgeInsets.only(right: 28,bottom: 70),
              alignment: Alignment.bottomRight,
               child: Transform.scale(
                  scale: 1,
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  fixedSize: Size(140, 45)
                  ),
                  child: Text("get started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),)),
                ),
             ),
            ],)
            
          ],)
        ],),
      )
    );
  }
}
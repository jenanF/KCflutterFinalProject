import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_final_project/welcome.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5),(){

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const WelcomeScreen()));

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 255, 255, 255),
        body: Center(
          child: Container(
          color: Color.fromARGB(249, 249, 249, 0),
          child: Image.asset("assets/images/logog.gif")),
        ),
      );
  }
}
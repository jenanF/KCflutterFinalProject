import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Help",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text('help', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: Colors.pink),),
            SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/botblack.png"),

            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(23),
                  child: Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(20)
                            .copyWith(topLeft: Radius.zero)),
                    child: Text(
                      "Hello, What Can I Help You With Today?",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 470, right: 26),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Transform.scale(
                      scale: 2,
                      child: ElevatedButton(
                        child: Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 18,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            shape: CircleBorder()),
                        onPressed: () {
                          //print(habits[1][4]);
                        },
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

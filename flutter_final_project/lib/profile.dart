import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.network(
            "https://cdn-icons-png.flaticon.com/512/1946/1946429.png",
            height: 200,
            width: 200,
          ),
          Spacer(),
          Text(
            "@name",
            style: TextStyle(fontSize: 30),
          ),
          Spacer(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.pink, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(children: [
                          profileList[0].icon,
                          SizedBox(
                            width: 18,
                          ),
                          Text(profileList[0].text),
                        ]),
                        profileList[0].go
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.pink, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(children: [
                          profileList[1].icon,
                          SizedBox(
                            width: 16,
                          ),
                          Text(profileList[1].text),
                        ]),
                        profileList[1].go
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.pink, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(children: [
                          profileList[2].icon,
                          SizedBox(
                            width: 18,
                          ),
                          Text(profileList[2].text),
                        ]),
                        SizedBox(
                          width: 30,
                        ),
                        profileList[2].go,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.pink, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(children: [
                          profileList[3].icon,
                          SizedBox(
                            width: 18,
                          ),
                          Text(profileList[3].text),
                        ]),
                        SizedBox(
                          width: 18,
                        ),
                        profileList[3].go
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
        ],
      )),
    );
  }
}

class Profile {
  Icon icon;
  String text;
  Icon go;

  Profile({
    required this.icon,
    required this.text,
    required this.go,
  });
}

List profileList = [
  Profile(
      icon: Icon(Icons.person),
      text: "My Account Info",
      go: Icon(Icons.arrow_forward_ios)),
  Profile(
      icon: Icon(Icons.credit_card_outlined),
      text: "My Subscription Info",
      go: Icon(Icons.arrow_forward_ios)),
  Profile(
      icon: Icon(Icons.settings),
      text: "Settings",
      go: Icon(Icons.arrow_forward_ios)),
  Profile(
      icon: Icon(Icons.info_outline),
      text: "About This App",
      go: Icon(Icons.arrow_forward_ios))
];

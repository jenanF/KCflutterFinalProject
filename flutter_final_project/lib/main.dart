import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
          color: Color.fromARGB(249, 249, 249, 249),
          child: Image.asset("assets/images/logo_.gif")),
        ),
      ),
    );
  }
}

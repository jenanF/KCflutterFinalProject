import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_final_project/home.dart';
import 'package:flutter_final_project/navbar.dart';
// ignore: unused_import
import 'package:flutter_final_project/splash.dart';
// ignore: unused_import
import 'package:flutter_final_project/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navbar()
    );
  }
}

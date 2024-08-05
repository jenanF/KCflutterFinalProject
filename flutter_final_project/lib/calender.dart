import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
   CalendarScreen({super.key});

  DateTime focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Container(child: Container(
             child: TableCalendar(
               focusedDay: focusedDate, 
               firstDay: DateTime.utc(2024,8,5), 
               lastDay: DateTime.utc(2024,8,10)),
           ),),),
    );
  }
}
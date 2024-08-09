import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class WidgetCalender extends StatelessWidget {
  const WidgetCalender({super.key});

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
      body: SfCalendar(
        view: CalendarView.month,
        initialSelectedDate: DateTime.now(),
        cellBorderColor: Colors.transparent,
        todayHighlightColor: Colors.pink,
        backgroundColor: Colors.white,
      ),
    );
  }
}

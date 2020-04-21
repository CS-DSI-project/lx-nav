import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
class Calendar extends StatefulWidget{
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Event Calendar"),
      ),
      body: Center(
        child: Text("Calendar"),
      ),
    );
  }
}
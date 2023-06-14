// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calenderinfo extends StatefulWidget {
  const Calenderinfo({super.key});

  @override
  State<Calenderinfo> createState() => _CalenderinfoState();
}

class _CalenderinfoState extends State<Calenderinfo> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calendar'),
        ),
        body: Column(
        children: [
          TableCalendar(headerStyle: HeaderStyle(formatButtonVisible: false),focusedDay:today , firstDay:DateTime.utc(2010,10,16), lastDay: DateTime.utc(2030,10,16)),
        ],
      )
      ),
    );
  }
}

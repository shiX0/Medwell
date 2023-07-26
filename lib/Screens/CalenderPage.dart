import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      _selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(

      body: Center(
        child: TableCalendar(
          focusedDay: _selectedDay,
          firstDay: DateTime.utc(2022, 1, 1),
          lastDay: DateTime.utc(2024, 12, 31),
          onDaySelected: _onDaySelected,
        ),
      ),
    ),
    );
  }
}



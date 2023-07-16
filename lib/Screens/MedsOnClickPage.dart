import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class MedsOnClick extends StatefulWidget {
  @override
  _MedsOnClickState createState() => _MedsOnClickState();
}

class _MedsOnClickState extends State<MedsOnClick> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
          child: Column(
              children: [
                CalendarTimeline(
              // showYears: true,
              initialDate: _selectedDate!,
              firstDate: _selectedDate!,
              lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
              onDateSelected: (date) => setState(() => _selectedDate = date),
              leftMargin: 20,
              monthColor:  Colors.black,
              dayColor: Colors.black,
              dayNameColor: const Color(0xFF333A47),
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Color(0xFFB2B5F5),
              dotsColor: const Color(0xFFFDEAEA),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),
              SizedBox(height: 10,)



        ]
      )
      )

    );
  }
}

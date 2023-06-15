import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class MedsOnClick extends StatefulWidget {
  const MedsOnClick({super.key});

  @override
  State<MedsOnClick> createState() => _MedsOnClickState();
}

class _MedsOnClickState extends State<MedsOnClick> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CalendarTimeline(initialDate: DateTime(2023,1,1), firstDate: DateTime(2022,1,1), lastDate: DateTime(2069,1,1), onDateSelected: (date) => print(date),leftMargin: 20,
        monthColor: Colors.blueGrey,
        dayColor: Colors.teal[200],
        activeDayColor: Colors.white,
        activeBackgroundDayColor: Colors.redAccent[100],
        dotsColor: Color(0xFF333A47),
        selectableDayPredicate: (date) => date.day != 23,
        locale: 'en_ISO',),
    );
  }
}

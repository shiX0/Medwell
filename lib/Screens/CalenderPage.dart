import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  DateTime today=DateTime.now();
  void _onDaySelected(DateTime day,DateTime focusedDay){
    setState(() {
      today=day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget content(){
    return Column(
      children: [
        Column(
          children: [
            Text("123"),
            Container(
              child: TableCalendar(
                focusedDay:today,
                firstDay:DateTime.utc(1975,1,1),
                lastDay:DateTime.utc(2030,12,31),
                onDaySelected:_onDaySelected,
                locale:"en_US",
                rowHeight:43,
                headerStyle:
                    HeaderStyle(formatButtonVisible:false,titleCentered:true),
                availableGestures:AvailableGestures.all,
                selectedDayPredicate:(day)=>isSameDay(day,today),


              ),
            )
          ],
        ),
      ],
    );
  }
}




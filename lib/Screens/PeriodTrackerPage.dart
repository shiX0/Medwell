import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: PeriodTracker(),
  ));
}

class PeriodTracker extends StatefulWidget {
  const PeriodTracker({super.key});

  @override
  State<PeriodTracker> createState() => _PeriodTrackerState();
}

class _PeriodTrackerState extends State<PeriodTracker> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [

          const SizedBox(height: 8),
          Container(
            height: 350,
            width: 350,
            decoration:
            child: Stack(
              children: [




              ],
            ),
          ),
          const SizedBox(height: 88),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             


            ],
          ),
        ],
      ),
    ));
  }
}

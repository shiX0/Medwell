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
              GestureDetector(
                onTap: () {
                  _showBloodModalSheet();
                },
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFEFEFEF),
                  ),
                  child: Image.asset(
                    "assets/images/blood.png",
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showMoodModalSheet();
                },
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFEFEFEF),
                  ),
                  child: Image.asset(
                    "assets/images/smile.png",
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showPainModalSheet();
                },
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFEFEFEF),
                  ),
                  child: Image.asset(
                    "assets/images/pain.png",
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

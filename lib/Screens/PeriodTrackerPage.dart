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



  
  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          CalendarTimeline(
            // showYears: true,
            initialDate: _selectedDate!,
            firstDate: _selectedDate!,
            lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
            onDateSelected: (date) => setState(() => _selectedDate = date),
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.black,
            dayNameColor: const Color(0xFF333A47),
            activeDayColor: Colors.white,
            activeBackgroundDayColor: const Color(0xFFB2B5F5),
            dotsColor: const Color(0xFFFDEAEA),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en',
          ),
          const SizedBox(height: 8),
          Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/images/image22.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: 140,
                  child: Container(
                    height: 50,
                    width: 150,
                    child: const Text(
                      "DAY",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 140,
                  child: Container(
                    height: 250,
                    width: 150,
                    child: const Text(
                      "3",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 150,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  left: 85,
                  child: Container(
                    height: 50,
                    width: 200,
                    child: const Text(
                      "Your Period ends today",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Positioned(
                  top: 270,
                  left: 260,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/image22.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 15,
                          left: 25,
                          child: Container(
                            height: 50,
                            width: 50,
                            child: const Text(
                              "5th",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35,
                          left: 20,
                          child: Container(
                            height: 50,
                            width: 50,
                            child: const Text(
                              "Cycle",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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

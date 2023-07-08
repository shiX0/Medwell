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



  void _showPainModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return ClipRRect(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius value as needed
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 300.0,
            color: Colors.white,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Pain",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Track pain to monitor your experience if there is a pattern",
                    style: TextStyle(fontSize: 14, color: Color(0xFF595353)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black54, width: 4),
                          ),
                          child: Image.asset("assets/icons/breath.png")
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Pain Free",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF595353)),
                        )
                      ]),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black54, width: 4),
                          ),
                          child: Image.asset("assets/icons/cramp.png")
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Leg pain",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF595353)),
                        )
                      ]),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black54, width: 4),
                          ),
                          child: Image.asset("assets/icons/cramps.png")
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Period Cramps",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF595353)),
                        )
                      ]),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black54, width: 4),
                          ),
                          child: Image.asset("assets/icons/relief.png",)
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Relief",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF595353)),
                        )
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Track",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMoodModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return ClipRRect(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius value as needed
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 300.0,
            color: Colors.white,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Mood",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Track your feelings to notice any change during your period.",
                    style: TextStyle(fontSize: 14, color: Color(0xFF595353)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.purple, width: 4),
                          ),
                          child: const Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.deepPurple,
                            size: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Happy",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF595353)),
                        )
                      ]),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.purple, width: 4),
                          ),
                          child: const Icon(
                            Icons.sentiment_satisfied_alt,
                            color: Colors.deepPurple,
                            size: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Normal",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF595353)),
                        )
                      ]),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.purple, width: 4),
                          ),
                          child: const Icon(
                            Icons.sentiment_dissatisfied_sharp,
                            color: Colors.deepPurple,
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Sad",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF595353)),
                        )
                      ]),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.purple, width: 4),
                          ),
                          child: const Icon(
                            Icons.face_sharp,
                            color: Colors.deepPurple,
                            size: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Sensitive",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF595353)),
                        )
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Track",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }

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

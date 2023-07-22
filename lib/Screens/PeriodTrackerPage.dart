import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:medwell/models/PeriodModel.dart';
import 'package:provider/provider.dart';
import '../viewmodels/Period_viewmodel.dart';

class PeriodTracker extends StatefulWidget {
  const PeriodTracker({super.key});

  @override
  State<PeriodTracker> createState() => _PeriodTrackerState();
}

class _PeriodTrackerState extends State<PeriodTracker> {
  DateTime? _selectedDate;
  late PeriodViewModel _periodViewModel;

  @override
  void initState() {
    _periodViewModel = Provider.of<PeriodViewModel>(context, listen: false);
    _periodViewModel.getPeriodData();
    PeriodModel? period = _periodViewModel.periodDetails;
    int cycleLength = period!.cycleLength as int;
    if (calculateDays() > cycleLength) {
      period.selectDate = DateTime.now().toString();
      period.nextPeriod=DateTime.now().add(Duration(days: cycleLength)).toString();
      period.currentCycle=(int.parse(period.currentCycle as String)+1).toString();
      _periodViewModel.editPeriodData(period);
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    });
    _resetSelectedDate();
    super.initState();
  }
  String showInfo(){
    int periodlen=_periodViewModel.periodDetails?.periodLength as int;
    int calcdays=calculateDays();
    if(calcdays==1){
    return "your period start from today";
    }else if(calcdays<periodlen){
      return "you are on your period";
    }
    else if(calcdays==periodlen){
      return "Your period ends today";
    }else{
      return "What a chill day";
    }
  }

  int calculateDays() {
    DateTime previous =
        DateTime.parse(_periodViewModel.periodDetails?.selectDate as String);
    DateTime current = DateTime.now();
    Duration difference = current.difference(previous);
    return difference.inDays + 1;
  }

  void _showBloodModalSheet() {
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
                    "Period",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Track your period and it flow to get cycle predictions.",
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
                            border: Border.all(color: Colors.red, width: 4),
                          ),
                          child: const Icon(
                            Icons.water_drop,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Light",
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
                            border: Border.all(color: Colors.red, width: 4),
                          ),
                          child: const Icon(
                            Icons.water_drop,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Medium",
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
                            border: Border.all(color: Colors.red, width: 4),
                          ),
                          child: const Icon(
                            Icons.water_drop,
                            color: Colors.red,
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Heavy",
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
                            border: Border.all(color: Colors.red, width: 4),
                          ),
                          child: const Icon(
                            Icons.water_drop,
                            color: Colors.red,
                            size: 60,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Extreme",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF595353)),
                        )
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
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
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 1.0),
                        child: Text(
                          "Track",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }

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
                              border:
                                  Border.all(color: Colors.black54, width: 4),
                            ),
                            child: Image.asset("assets/icons/breath.png")),
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
                              border:
                                  Border.all(color: Colors.black54, width: 4),
                            ),
                            child: Image.asset("assets/icons/cramp.png")),
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
                              border:
                                  Border.all(color: Colors.black54, width: 4),
                            ),
                            child: Image.asset("assets/icons/cramps.png")),
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
                              border:
                                  Border.all(color: Colors.black54, width: 4),
                            ),
                            child: Image.asset(
                              "assets/icons/relief.png",
                            )),
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
                  height: 20,
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
                  height: 20,
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
    return Consumer<PeriodViewModel>(builder: (context, periodVM, child) {
      return Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: CalendarTimeline(
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
            ),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
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
                      left: 120,
                      child: Container(
                        height: 60,
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
                      top: 85,
                      left: 120,
                      child: Container(
                        height: 250,
                        width: 150,
                        child: Text(
                          calculateDays().toString(),
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 150,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 250,
                      left: 100,
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Text(
                          showInfo(),
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
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
                                child: Text(
                                  periodVM.periodDetails!.currentCycle
                                      as String,
                                  style: const TextStyle(
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
                                      fontSize: 16,
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
    });
  }
}

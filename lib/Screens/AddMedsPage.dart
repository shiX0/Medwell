import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/DropDown.dart';
import 'package:medwell/Components/DropDownOnly.dart';
import 'package:medwell/Components/IconTextField.dart';
import 'package:medwell/Components/Palette.dart';
import 'package:medwell/Screens/NavPages.dart';

class AddMedsPage extends StatefulWidget {
  @override
  _AddMedsPageState createState() => _AddMedsPageState();
}

class _AddMedsPageState extends State<AddMedsPage> {
  List<TimeOfDay> _selectedTimes = [];

  TextEditingController medname=TextEditingController();
  TextEditingController nomeds=TextEditingController();
  TextEditingController medtype=TextEditingController();
  TextEditingController meddays=TextEditingController();
  TextEditingController daytype=TextEditingController();
  TextEditingController timing=TextEditingController();
  TextEditingController notitimes=TextEditingController();



  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && !_selectedTimes.contains(pickedTime)) {
      setState(() {
        _selectedTimes.add(pickedTime);
      });
    }
  }

  Future<void> _editTime(BuildContext context, TimeOfDay time) async {
    final TimeOfDay? editedTime = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (editedTime != null) {
      setState(() {
        final index = _selectedTimes.indexOf(time);
        if (index >= 0) {
          _selectedTimes[index] = editedTime;
        }
      });
    }
  }

  void _removeTime(TimeOfDay time) {
    setState(() {
      _selectedTimes.remove(time);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Image.asset("assets/images/back.png"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NavPages()),
                  );
                  // TODO: Implement back button functionality
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Add Medication',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Name',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            IconTextField(imagePath: "assets/images/pills.png", hintText: ""),
            SizedBox(height: 16.0),
            Text(
              'Amount & How long?',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                DropDown(
                  items: ["Pills", "Capsules", "Bottles", "Injection"],
                  selectedItem: "Pills",
                  onChanged: (String selectedItem) {
                    // Handle the selected item change here
                  },
                  iconUrl: "assets/images/pills2.png",
                ),
                SizedBox(
                  height: 16.0,
                  width: 10.0,
                ),
                DropDown(
                  items: ["Days", "Weeks", "Months", "Year"],
                  selectedItem: "Days",
                  onChanged: (String selectedItem) {
                    // Handle the selected item change here
                  },
                  iconUrl: "assets/images/calendarLogo.png",
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Timing',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            DropDownOnly<String>(
              items: ["Before Eating", "After Eating", "Empty Stomach"],
              selectedItem: "Before Eating",
              onChanged: (String? selectedItem) {},
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Notification',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedTimes.length,
                itemBuilder: (context, index) {
                  final time = _selectedTimes[index];
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    tileColor: Color(0xFFF8F8F6),
                    leading: Icon(Icons.notifications),
                    title: Text(time.format(context)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _editTime(context, time),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => _removeTime(time),
                        ),
                      ],
                    ),
                    onTap: () => _editTime(context, time),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFF8F8F6),
                    offset: Offset(0, 8),
                    blurRadius: 24,
                  ),
                ],
              ),
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () => _selectTime(context),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(330, 60),
                  backgroundColor: Color(0xFFF8F8F6),
                  elevation: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Color(0xFFFFC0C0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => "",
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(330, 60),
                    backgroundColor: Pallete.primary,
                    elevation: 8,
                  ),
                  child: Text(
                    "Done",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

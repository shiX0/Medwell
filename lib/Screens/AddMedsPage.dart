import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/DropDown.dart';
import 'package:medwell/Components/DropDownOnly.dart';
import 'package:medwell/Components/IconTextField.dart';
import 'package:medwell/Components/Palette.dart';
import 'package:medwell/Screens/NavPages.dart';

import '../models/MedsModel.dart';
import '../repositories/MedsRepository.dart';

class AddMedsPage extends StatefulWidget {
  @override
  _AddMedsPageState createState() => _AddMedsPageState();
}

class _AddMedsPageState extends State<AddMedsPage> {
  List<String> _selectedTimes = [];
  TextEditingController _medname = TextEditingController();
  TextEditingController _medamount = TextEditingController();
  TextEditingController _medtype = TextEditingController();
  TextEditingController _meddays = TextEditingController();
  TextEditingController _daytype = TextEditingController();
  TextEditingController _timing = TextEditingController();

  void saveMeds() async {
    try {
      final MedsModel data = MedsModel(
        medname: _medname.text,
        medamount: num.parse(_medamount.text.toString()),
        medtype: _medtype.text,
        meddays: num.parse(_meddays.text.toString()),
        daytype: _daytype.text,
        timing: _timing.text,
        notitimes: _selectedTimes,
        // userId: _authViewModel.loggedInUser!.userId,
      );
      await MedsRepository().addMeds(data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        final formattedTime = pickedTime.format(context); // Convert TimeOfDay to a string
        _selectedTimes.add(formattedTime);
      });
    }
  }

  Future<void> _editTime(BuildContext context, String time) async {
    final pickedTime = TimeOfDay(
      hour: int.parse(time.split(":")[0]),
      minute: int.parse(time.split(":")[1]),
    );

    final TimeOfDay? editedTime = await showTimePicker(
      context: context,
      initialTime: pickedTime,
    );

    if (editedTime != null) {
      setState(() {
        final formattedTime = editedTime.format(context); // Convert TimeOfDay to a string
        final index = _selectedTimes.indexOf(time);
        if (index >= 0) {
          _selectedTimes[index] = formattedTime;
        }
      });
    }
  }

  void _removeTime(String time) {
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
                textStyle: Theme.of(context).textTheme.headline6,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Name',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headline6,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            IconTextField(imagePath: "assets/images/pills.png", hintText: "", controller: _medname),
            SizedBox(height: 16.0),
            Text(
              'Amount & How long?',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headline6,
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
                  textFieldController: _medamount,
                  dropDownController: _medtype,
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
                  textFieldController: _meddays,
                  dropDownController: _daytype,
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
                textStyle: Theme.of(context).textTheme.headline6,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            DropDownOnly<String>(
              controller: _timing,
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
                textStyle: Theme.of(context).textTheme.headline6,
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
                    title: Text(time),
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
                  onPressed: () {
                    saveMeds();
                    //Fix this later on Doesnt work properly, need to go back to navpages after added
                    SnackBar(content: Text("Successful"));
                    Navigator.of(context).pushNamed("/NavPages");
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(330, 60),
                    backgroundColor: Pallete.primary,
                    elevation: 8,
                  ),
                  child: Text(
                    "Done",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headline6,
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

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medwell/Screens/HomePage.dart';
import 'package:medwell/Screens/NavPages.dart';

import '../Components/DropDown.dart';
import '../Components/DropDownOnly.dart';
import '../Components/IconTextField.dart';
import '../Components/Palette.dart';
import '../models/MedsModel.dart';
import '../repositories/MedsRepository.dart';
import '../services/NotificationService.dart';
import '../services/firebase_service.dart';

class EditMedsPage extends StatefulWidget {
  final MedsModel medication;

  EditMedsPage({required this.medication});

  @override
  _EditMedsPageState createState() => _EditMedsPageState();
}

class _EditMedsPageState extends State<EditMedsPage> {
  final _auth = FirebaseService.firebaseAuth;
  List<DateTime> _selectedTimes = [];
  TextEditingController _medname = TextEditingController();
  TextEditingController _medamount = TextEditingController();
  TextEditingController _medtype = TextEditingController();
  TextEditingController _meddays = TextEditingController();
  TextEditingController _daytype = TextEditingController();
  TextEditingController _timing = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    // Prefill the text fields with the data from the medication passed in the constructor
    _medname.text = widget.medication.medname.toString();
    _medamount.text = widget.medication.medamount.toString();
    _medtype.text = widget.medication.medtype.toString();
    _meddays.text = widget.medication.meddays.toString();
    _daytype.text = widget.medication.daytype.toString();
    _timing.text = widget.medication.timing.toString();
    _selectedTimes = widget.medication.notitimes!.toList();
  }

  void updateMeds() async {
    try {
      final updatedData = MedsModel(
        medname: _medname.text,
        medamount: num.parse(_medamount.text.toString()),
        medtype: _medtype.text,
        meddays: num.parse(_meddays.text.toString()),
        daytype: _daytype.text,
        timing: _timing.text,
        notitimes: _selectedTimes,
        userId: _auth.currentUser?.uid,
        id: widget.medication.id,
      );
      await MedsRepository().updateMeds(widget.medication.id,updatedData);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Updated successfully")));
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    if (_selectedTimes.length < 10) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          final now = DateTime.now();
          final selectedDateTime = DateTime(
            now.year,
            now.month,
            now.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _selectedTimes.add(selectedDateTime);
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You can only add schedule up to 10 times")));
    }
  }

  Future<void> _editTime(BuildContext context, DateTime time) async {
    final pickedTime = TimeOfDay(hour: time.hour, minute: time.minute);

    final TimeOfDay? editedTime = await showTimePicker(
      context: context,
      initialTime: pickedTime,
    );

    if (editedTime != null) {
      setState(() {
        final updatedDateTime = DateTime(
          time.year,
          time.month,
          time.day,
          editedTime.hour,
          editedTime.minute,
        );
        final index = _selectedTimes.indexOf(time);
        if (index >= 0) {
          _selectedTimes[index] = updatedDateTime;
        }
      });
    }
  }

  void _removeTime(DateTime time) {
    setState(() {
      _selectedTimes.remove(time);

      if (_selectedTimes.isEmpty) {
        // Cancel any scheduled notifications if there are no selected times
        NotificationService.cancelNotifications();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
                        MaterialPageRoute(builder: (context) => NavPages()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Edit Medication',
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headline6,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Name',
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headline6,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 16.0),
                IconTextField(imagePath: "assets/images/pills.png", hintText: "Medication Name", controller: _medname),
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
                SizedBox(height: 16.0),
                Row(
                  children: [
                    DropDown(
                        textFieldController: _medamount,
                        dropDownController: _medtype,
                        items: ["Type", "Pills", "Capsules", "Injection","Others"],
                        selectedItem: "Type",
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
                        items: ["Time", "Days", "Weeks", "Months", "Year"],
                        selectedItem: "Time",
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
                  items: ["Select Timing", "Before Eating", "After Eating", "Empty Stomach","Other"],
                  selectedItem: "Select Timing",
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _selectedTimes.length,
                  itemBuilder: (context, index) {
                    final time = _selectedTimes[index];
                    final formattedTime = DateFormat.Hm().format(time);
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      tileColor: Color(0xFFF8F8F6),
                      leading: Icon(Icons.notifications),
                      title: Text(formattedTime),
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
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Container(
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
                    width: 330,
                    height: 60,
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
                          SizedBox(width: 8),
                          Text(
                            "Add Notification",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        updateMeds();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Updated successfully")));
                        NotificationService.scheduleNotification(title: "Medication name:"+widget.medication.medname.toString(), body: "Take Medication", scheduledTime: _selectedTimes);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NavPages()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(330, 60),
                        backgroundColor: Pallete.primary,
                        elevation: 8,
                      ),
                      child: Text(
                        "Update Medication",
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medwell/Components/DropDown.dart';
import 'package:medwell/Components/DropDownOnly.dart';
import 'package:medwell/Components/IconTextField.dart';
import 'package:medwell/Components/Palette.dart';
import 'package:medwell/Screens/NavPages.dart';

import '../models/MedsModel.dart';
import '../repositories/MedsRepository.dart';
import '../services/NotificationService.dart';

class AddMedsPage extends StatefulWidget {
  @override
  _AddMedsPageState createState() => _AddMedsPageState();
}

class _AddMedsPageState extends State<AddMedsPage> {
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
  }

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
      );
      await MedsRepository().addMeds(data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    if (_selectedTimes.length<10){
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
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You can only add scedule upto 10 ties")));
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
                        MaterialPageRoute(builder: (context) => const NavPages()),
                      );
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
                      items: ["Type","Pills", "Capsules", "Bottles", "Injection"],
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
                      items: ["Time","Days", "Weeks", "Months", "Year"],
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
                  items: ["Select Timing","Before Eating", "After Eating", "Empty Stomach"],
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
                        saveMeds();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successful")));
                        NotificationService.scheduleNotification(title: "Medication", body: "Take Meds", scheduledTime: _selectedTimes);
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
        ),
      ),
    );
  }
}

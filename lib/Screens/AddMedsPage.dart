import 'package:flutter/material.dart';
import 'package:medwell/Components/DropDown.dart';
import 'package:medwell/Components/DropDownOnly.dart';
import 'package:medwell/Components/IconTextField.dart';

class AddMedsPage extends StatelessWidget {
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
                  // TODO: Implement back button functionality
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Add Medication',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Pills Name',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0,),
            IconTextField(imagePath: "assets/images/pills.png", hintText: ""),
            SizedBox(height: 16.0),
            Text(
              'Amount & How long?',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            DropDown(items: ["Pills","Capsules","Bottles","Injection"], selectedItem: "Pills", onChanged: (String selectedItem) {
             // Handle the selected item change here
           },iconUrl: "assets/images/pills2.png"),
            DropDown(items: ["Days","Weeks","Months","Year"], selectedItem: "Days", onChanged: (String selectedItem) {
              // Handle the selected item change here
            }, iconUrl: "assets/images/pills2.png"),
            SizedBox(height: 16.0,),
            Text(
              'Timing',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0,),
            DropDownOnly<String>(items: ["Before Eating","After Eating","Empty Stomach"], selectedItem: "Before Eating", onChanged: (String? selectedItem){}),

            SizedBox(height: 16.0,),
            Text(
              'Notification',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            // Add more components for medication details
          ],

        ),
      ),

    );
  }
}

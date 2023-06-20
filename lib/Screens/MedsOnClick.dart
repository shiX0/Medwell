import 'package:flutter/material.dart';

class MedsOnClick extends StatefulWidget {
  @override
  _MedsOnClickState createState() => _MedsOnClickState();
}

class _MedsOnClickState extends State<MedsOnClick> {
  List<String> medicineTimings = [];

  @override
  void initState() {
    super.initState();
    // Initialize the medicine timings list with example data
    medicineTimings = [
      'Morning',
      'Afternoon',
      'Evening',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('MedsOnClick'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(right: 8.0),
                  color: Colors.grey,
                  child: Center(
                    child: Text('Day 1'),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(right: 8.0),
                  color: Colors.grey,
                  child: Center(
                    child: Text('Day 2'),
                  ),
                ),
                // Add more day containers as needed
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Medicine Name',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Take X medicine(s) for Y day(s)',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Text(
            'Time to take medicine:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Column(
            children: List.generate(medicineTimings.length, (index) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blue,
                ),
                child: Text(
                  medicineTimings[index],
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              );
            }),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle mark as taken button
            },
            child: Text('Mark as Taken'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle edit medication button
            },
            child: Text('Edit Medication'),
          ),
        ],
      ),
    );
  }
}

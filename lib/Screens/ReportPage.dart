

import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Report a Problem'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              maxLines: null, // Allows multiline input
              decoration: InputDecoration(
                hintText: "Briefly explain what happend or what's not working",
              ),
            ),
            SizedBox(height: 500),
            ElevatedButton.icon(
              onPressed: () {
                // Handle image upload logic here
              },
              icon: Icon(Icons.image),
              label: Text('Upload '),
            ),
          ],
        ),
      ),
    );
  }
}

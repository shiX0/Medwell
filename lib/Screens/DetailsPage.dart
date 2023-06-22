import 'package:flutter/material.dart';

import '../Components/InputField.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            CustomTextInputField(hintText: "First Name",keyboardType: TextInputType.text,),
            SizedBox(height: 10,),
            CustomTextInputField(hintText: "last Name",keyboardType: TextInputType.text,)
          ],
        ),
      ),
    );
  }
}

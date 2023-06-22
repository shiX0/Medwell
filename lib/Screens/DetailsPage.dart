import 'package:flutter/material.dart';
import 'package:medwell/Components/DropDownOnly.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              CustomTextInputField(hintText: "First Name",keyboardType: TextInputType.text,),
              SizedBox(height: 10,),
              CustomTextInputField(hintText: "last Name",keyboardType: TextInputType.text,),
              DropDownOnly(items: ["male","female"], selectedItem: "select your gender", onChanged: (String? selectedItem){}),
            ],
          ),
        ),
      ),
    );
  }
}

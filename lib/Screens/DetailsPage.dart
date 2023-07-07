import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medwell/Components/CustomButton.dart';
import 'package:medwell/Components/DropDownOnly.dart';
import 'package:medwell/repositories/UserRepository.dart';
import 'package:medwell/services/firebase_service.dart';

import '../Components/InputField.dart';
import '../models/UserModel.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _auth = FirebaseService.firebaseAuth;
  Future<void> uploadDetails(User user) async {
    try {
      UserRepository userRepository = UserRepository();
      await userRepository.addUser(user);
      Navigator.of(context).pushNamed("/profile");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Welcome to MedWell"),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  static DateTime dateOnly(DateTime date) {
    return DateTime(date.year);
  }

  final selecttime = "Select your Birthday";
  bool timeSelected = false;
  TextEditingController genderTextController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2024))
        .then((value) {
      setState(() {
        if (value != null) {
          timeSelected = true;
          _dateTime = value;
        } else {
          timeSelected = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CustomTextInputField(
                hintText: "First Name",
                keyboardType: TextInputType.text,
                editingController: _firstNameController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextInputField(
                hintText: "last Name",
                keyboardType: TextInputType.text,
                editingController: _lastNameController,
              ),
              DropDownOnly(
                  controller: genderTextController,
                  items: ["select your gender", "male", "female"],
                  selectedItem: "select your gender",
                  onChanged: (String? selectedItem) {}),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFFFC0C0),
                      offset: Offset(0, 8),
                      blurRadius: 24,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: _showDatePicker,
                  child: Column(
                    children: [
                      Text(timeSelected
                          ? dateOnly(_dateTime).year.toString()
                          : selecttime),
                      const SizedBox(
                        width: 30,
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              CustomButton(
                buttonText: "Take me to home",
                onPressed: () {
                  User user = User(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      dob: _dateTime.toString(),
                      email: _auth.currentUser?.email,
                      id: _auth.currentUser?.uid,
                      gender: genderTextController.text);
                  uploadDetails(user);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

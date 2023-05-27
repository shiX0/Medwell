import 'package:flutter/material.dart';
import 'package:medwell/Components/InputField.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: Center(
        child: Column(
          children: const [
            InputField(hintText: "email"),
          ],
        ),
      ),
    ),
    );
  }
}

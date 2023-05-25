import 'package:flutter/material.dart';
import 'package:medwell/Components/InputField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/CustomButton.dart';
import 'package:medwell/Components/InputField.dart';

import '../Components/HighlightButton.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Padding(
                      padding: const EdgeInsets.all(20),
                  child: Image.asset("assets/images/Logo.png"),
                ),
                const SizedBox(height: 20,),
                const CustomTextInputField(hintText: "Email", keyboardType: TextInputType.text),
                const SizedBox(height: 20,),
                const CustomTextInputField(hintText: "Password", keyboardType: TextInputType.visiblePassword),
                const SizedBox(height: 20,),
                const CustomTextInputField(hintText: "Confirm Password", keyboardType: TextInputType.visiblePassword),
                const SizedBox(height: 30,),
                const CustomButton(buttonText: "Create an Account"),
                const SizedBox(height: 130,),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already a member?",
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.labelMedium,
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                      ),
                    ),
                    const CustomTextButton(label: "login now")
                ],
                )
              ],
            ),
          ),
        ),
    );
  }
}

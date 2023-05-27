import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/CustomButton.dart';
import 'package:medwell/Components/HighlightButton.dart';
import 'package:medwell/Components/InputField.dart';
import 'package:medwell/Components/SocialButtons.dart';

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
            children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/images/Logo.png"),
            ),
            const SizedBox(height: 20,),
              const CustomTextInputField(hintText: "Email", keyboardType: TextInputType.text),
              const SizedBox(height: 20,),
              const CustomTextInputField(hintText: "Password", keyboardType: TextInputType.visiblePassword),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(label: "Forgot password?"),
                ],
              ),
              const SizedBox(height: 20,),
              const CustomButton(buttonText: "log in"),
              const SizedBox(height: 20,),
              Center(child: Text("or",
                  style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.labelMedium,
                  fontWeight: FontWeight.w400,
                  fontSize: 16
              ),
              )),
              const SizedBox(height: 10,),
              const SocialButton(label: "Sign in with Google", imagePath: "assets/images/google.png"),
              const SizedBox(height: 10,),
              const SocialButton(label: "Sign in with Apple", imagePath: "assets/images/apple.png"),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("no accounts?",
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                    ),
                  ),
                  CustomTextButton(label: "register now")
                ],
              )

          ],
        ),
      ),
    ),
    );
  }
}

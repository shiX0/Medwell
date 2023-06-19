import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(_auth.currentUser!=null){
        Navigator.of(context).pushNamed("/profile");
      }
    });
    super.initState();
  }
  void _login() async {
    try {
      final user =await _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Success")));
      Navigator.of(context).pushNamed("/profile");
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.message.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

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
              CustomTextInputField(hintText: "Email", keyboardType: TextInputType.text,editingController: _emailController,),
              const SizedBox(height: 20,),
              CustomTextInputField(hintText: "Password", keyboardType: TextInputType.visiblePassword,editingController: _passwordController,),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(label: "Forgot password?"),
                ],
              ),
              const SizedBox(height: 20,),
              CustomButton(buttonText: "log in",onPressed: _login,),
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
                  const CustomTextButton(label: "register now"),
                ],
              )

          ],
        ),
      ),
    ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/CustomButton.dart';
import 'package:medwell/Components/HighlightButton.dart';
import 'package:medwell/Components/InputField.dart';
import 'package:medwell/Components/SocialButtons.dart';
import 'package:medwell/repositories/AuthRepository.dart';
import 'package:medwell/viewmodels/Auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late AuthViewModel _authViewModel;
  @override
  void initState() {
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_auth.currentUser != null) {
        Navigator.of(context).pushNamed("/TrackPeriodPage");
      }
    });
    super.initState();
  }

  void _login() async {
    try {
      await _authViewModel
          .login(_emailController.text, _passwordController.text)
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Success"), backgroundColor: Colors.green));
        Navigator.of(context).pushNamed("/TrackPeriodPage");
      });
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.message.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  void openRegister() {
    Navigator.of(context).pushNamed("/register");
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
              const SizedBox(
                height: 20,
              ),
              CustomTextInputField(
                hintText: "Email",
                keyboardType: TextInputType.text,
                editingController: _emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextInputField(
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
                editingController: _passwordController,
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(label: "Forgot password?"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonText: "log in",
                onPressed: () {
                  _login();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "or",
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.labelMedium,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              )),
              const SizedBox(
                height: 10,
              ),
              const SocialButton(
                  label: "Sign in with Google",
                  imagePath: "assets/images/google.png"),
              const SizedBox(
                height: 10,
              ),
              const SocialButton(
                  label: "Sign in with Apple",
                  imagePath: "assets/images/apple.png"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "no accounts?",
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  CustomTextButton(
                    label: "register now",
                    onPressed: openRegister,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class ValidateLogin {
  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }
}
import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscureTextPassword = true;
  bool _obscureTextPasswordConfirm = true;

  String _uid = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void registerhandler(){
    register();
  }
  Future<void> register() async {
    try {
      final user= await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("success")));
      Navigator.of(context).pushNamed("/profile");
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.message.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Padding(
                          padding: const EdgeInsets.all(20),
                      child: Image.asset("assets/images/Logo.png"),
                    ),
                    const SizedBox(height: 20,),
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: CustomTextInputField(hintText: "Email", keyboardType: TextInputType.text,validator: (value){
                        final RegExp emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if(value == null || value.isEmpty ){
                          return "Email is required";
                        }
                        if(!emailValid.hasMatch(value)){
                          return "Please enter a valid email";
                        }
                        return null;
                        },editingController: _emailController,),
                     ),
                    const SizedBox(height: 20,),
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: CustomTextInputField(hintText: "Password", keyboardType: TextInputType.text,enablePasswordField: true,editingController: _passwordController,validator: (String? value){
                         if(value == null || value.isEmpty ){
                           return "Password is required";
                         }
                         if(value.length < 8){
                           return "Password should be at least 8 character";
                         }
                         if(_confirmPasswordController.text != value){
                           return "Please make sure both the password are the same";
                         }
                         return null;
                       },),
                     ),
                    const SizedBox(height: 20,),
                     Padding(
                       padding: const EdgeInsets.all(1.0),
                       child: CustomTextInputField(hintText: "Confirm Password", keyboardType: TextInputType.text,editingController: _confirmPasswordController,validator: (String? value){
                         if(value == null || value.isEmpty ){
                           return "Password is required";
                         }
                         if(value.length < 8){
                           return "Password should be at least 8 character";
                         }
                         if(_passwordController.text != value){
                           return "Please make sure both the password are the same";
                         }
                         return null;
                       },),
                     ),
                    const SizedBox(height: 30,),
                    CustomButton(buttonText: "Create an Account",onPressed: (){
                        bool validated= _formKey.currentState!.validate();
                        if(validated){
                        register;}
                        },
                      ),
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
          ),
        ),
    );
  }
}

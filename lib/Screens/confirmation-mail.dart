import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/Pallete.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({Key? key}) : super(key: key);

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _fieldOne = TextEditingController();
    final TextEditingController _fieldTwo = TextEditingController();
    final TextEditingController _fieldThree = TextEditingController();
    final TextEditingController _fieldFour = TextEditingController();
    final TextEditingController _fieldFive = TextEditingController();
    final TextEditingController _fieldSix = TextEditingController();

    final FocusNode _fieldOneNode = FocusNode();
    final FocusNode _fieldTwoNode = FocusNode();
    final FocusNode _fieldThreeNode = FocusNode();
    final FocusNode _fieldFourNode = FocusNode();
    final FocusNode _fieldFiveNode = FocusNode();
    final FocusNode _fieldSixNode = FocusNode();
    return Scaffold(
      body:SafeArea(
        child:SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),


                child: Image.asset(
                  'assets/images/emailv.png',
                  width: 302,
                  height: 300,
                ),
              ),
                SizedBox(height: 10,),

                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "Email Verification!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.64,
                        color: Color(0xff000000),
                        height: 1.1875,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(

                    "Beep boop beep! We need to verify that\n Aashista@gmail.com is not a robot (or at\n least a really good one)",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                        // letterSpacing: -0.16,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    OtpInput(_fieldOne, true,focusNode: _fieldOneNode),
                    OtpInput(_fieldTwo, false, focusNode: _fieldTwoNode),
                    OtpInput(_fieldThree, false, focusNode: _fieldThreeNode),
                    OtpInput(_fieldFour, false, focusNode: _fieldFourNode),
                    OtpInput(_fieldFive, false, focusNode: _fieldFiveNode),
                    OtpInput(_fieldSix, false, focusNode: _fieldSixNode)
                  ],
                ),
                SizedBox(height: 40,),

                Container(
                  margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      shadowColor: const Color(0xdbffbdbd),
                      primary: const Color(0xdbffbdbd),
                    ),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        "Verify",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          letterSpacing: 0.08,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 120,),

                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Didn\'t receive an email? ",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                              letterSpacing: -0.16,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: "Resend Now!",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.25,
                              letterSpacing: -0.16,
                              color: Color(0xff7173a7),
                            ),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {

                            },
                        ),
                      ],
                    ),
                  ),
                )


              ]
          ),
        ),



      )
    );
  }
}

// Create an input widget that takes only one digit

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final FocusNode focusNode;
  const OtpInput(this.controller, this.autoFocus, {required this.focusNode, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 40,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,

        decoration: const InputDecoration(
            fillColor: Pallete.accent,
            filled: true,

            border: OutlineInputBorder(),
            counterText: '',

            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.isEmpty) {
            focusNode.previousFocus();
          } else if (value.length == 1) {
            focusNode.nextFocus();
          }
        },
        focusNode: focusNode,
      ),
    );
  }
}
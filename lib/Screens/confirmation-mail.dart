import 'package:flutter/material.dart';

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

              ]
          ),
        ),



      )
    );
  }
}

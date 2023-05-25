import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//in order to use(Poppains) google fonts, we need to add google_fonts: ^4.0.5 in pubspec.yaml file
//and then import 'package:google_fonts/google_fonts.dart';
//dart - sdk must be  >= 3.0.1
//assets image is used in this project

class finalLog extends StatelessWidget {
  const finalLog({super.key});

  @override
  Widget build(BuildContext context) {
    //to make screen responsive according to device size
    // double baseWidth = 374;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    // double sfem = fem * 0.95;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 155, 3),
              child: Text(
                "Congrats!",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.64,
                    color: Color(0xff000000),
                    height: 1.1875,
                  ),
                ),
              ),
            ),
            Text(
              "Let\'s get started on your journey to better\nhealth together.",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                  letterSpacing: -0.16,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // group4FwC (522:12)
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              width: 372,
              height: 407,
              child: Image.asset(
                'assets/images/group-4.png',
                width: 372,
                height: 407,
              ),
            ),
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
                    "Proceed!",
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
          ],
        ),
      ),
    );
  }
}
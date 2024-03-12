import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/Palette.dart';

class Period extends StatelessWidget {
  const Period({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:  Colors.white,
      body: SafeArea(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              // group4FwC (522:12)
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              width: 372,
              height: 407,
              child: Image.asset(
                'assets/images/period1.png',
                width: 372,
                height: 407,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 155, 3),
              child: Text(
                "Track Period",
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
              "Take charge of your menstrual cycle and enjoy the benefits of a healthier lifestyle.",
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
              margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, backgroundColor: Pallete.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  shadowColor: Pallete.primary,
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/CustomButton.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xffffffff),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: -10, vertical: 0),
                          ),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'assets/images/material-symbols-arrow-back-ios-rounded-5Gz.png',
                              width: 25,
                              height: 25,
                              color: const Color(0xC0000000),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                            letterSpacing: -0.16,
                            color: Color(0x99000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    // autogroupdmmwB4r (ErZSkoBLMoSD1NrCACDMMw)
                    width: double.infinity,
                    height: 451,
                    child: Stack(
                      children: [
                        Positioned(
                          // ellipse10umY (535:148)
                          left: 0,
                          top: 115,
                          child: Align(
                            child: SizedBox(
                              width: 388,
                              height: 335,
                              child: Image.asset(
                                'assets/images/Ellipse 14.png',
                                width: 388,
                                height: 335,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // ellipse11QTQ (535:149)
                          left: 0,
                          top: 0,
                          child: Align(
                            child: SizedBox(
                              width: 559.04,
                              height: 558.47,
                              child: Image.asset(
                                'assets/images/Ellipse 15.png',
                                width: 559.04,
                                height: 558.47,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group588W (535:157)
                          left: 0,
                          top: 76,
                          child: Align(
                            child: SizedBox(
                              width: 374,
                              height: 374,
                              child: Image.asset(
                                'assets/images/Group 1.png',
                                width: 374,
                                height: 374,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 30, top: 24),
                child: Text(
                  "Ahoy, me hearties!",
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
                "Effortlessly track medications and\nperiods with streamlined health app.",
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
              const SizedBox(
                height: 30,
              ),
              CustomButton(buttonText: "Get started", onPressed: (){},),

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewMedsPage extends StatelessWidget {
  const NewMedsPage({Key? key}) : super(key: key);

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
                                'assets/images/ellipse-10.png',
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
                              child: Image.asset(
                                'assets/images/ellipse-11.png',
                                width: 559.04,
                                height: 558.47,
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
                                'assets/images/group-5.png',
                                width: 374,
                                height: 374,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group55q2v (535:394)
                          left: 24,
                          top: 471,
                          child: Container(
                            width: 330,
                            height: 200,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,

              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 30, top: 24),
                child: Text(
                  "Track Medications",
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
                "Keep track of all your medications in one\n convenient place!",
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
            ],
          ),
        ),
      ),
    );
  }
}

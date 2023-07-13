import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/Palette.dart';
import '../Components/ProfileButton.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool status = false;
  bool status1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffd9d9d9),

                  ),
                  margin: const EdgeInsets.only(top:50 ),
                  // child: Image.asset("assets/images/pic.png"),
                  height: 90,
                  width: 90,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text ("Puja Shahi",style:GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,

                      height: 1.25,
                      letterSpacing: -0.16,
                      color: Color(0xff000000),
                    ),
                  ) ,),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: const Text("20y/o.20 days streaks"),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text("Genral settings",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13
                    ),),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    shadowColor: const Color(0xfff8f8f6),
                    primary: const Color(0xfff8f8f6),
                  ),
                  child: Container(
                    height: 60,
                    width: 350,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Text(

                    "Notifications",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,

                              height: 1.25,
                              letterSpacing: -0.16,
                              color: Color(0xff000000),
                            ),

                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 152,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FlutterSwitch(
                            width: 42.0,
                            height: 23.0,
                            valueFontSize: 0,
                            activeColor: Color(0xffFFB6B6),
                            toggleSize: 25.0,
                            value: status1,
                            borderRadius: 30.0,
                            padding: 0.5,
                            showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                status1 = val;
                              });
                            },
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    shadowColor: const Color(0xfff8f8f6),
                    primary: const Color(0xfff8f8f6),
                  ),
                  child: Container(
                    height: 60,
                    width: 350,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Text(
                          "Enable track period",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,

                              height: 1.25,
                              letterSpacing: -0.16,
                              color: Color(0xff000000),
                            ),

                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 92,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FlutterSwitch(
                            width: 42.0,
                            height: 23.0,
                            valueFontSize: 0,
                            activeColor: Color(0xffFFB6B6),
                            toggleSize: 25.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 0.5,
                            showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),

                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text("Account Settings",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13
                    ),),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red),

                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      shadowColor: const Color(0xfff8f8f6),
                      primary: const Color(0xfff8f8f6),
                    ),
                    child: Container(
                        height: 60,
                        width: 350,
                        alignment: Alignment.center,
                        child: Text("Delete Account",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.25,
                                letterSpacing: -0.16,
                                color: Color(0xffff4747),
                              ),
                            )))),
                      SizedBox(height: 20,),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text("Feedback",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13
                    ),),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    shadowColor: const Color(0xfff8f8f6),
                    primary: const Color(0xfff8f8f6),
                  ),
                  child: Container(
                    height: 60,
                    width: 350,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Send Feedacks",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,

                          height: 1.25,
                          letterSpacing: -0.16,
                          color: Color(0xff000000),
                        ),

                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),

                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    shadowColor: const Color(0xfff8f8f6),
                    primary: const Color(0xfff8f8f6),
                  ),
                  child: Container(
                    height: 60,
                    width: 350,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Report Bugs",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,

                          height: 1.25,
                          letterSpacing: -0.16,
                          color: Color(0xff000000),
                        ),

                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                // ProfileButtonWidget(
                //   btntitle: 'About',
                //   icon: "assets/icons/about.png",
                //   width: 180,
                //   suffixIcon: Icons.arrow_forward_ios,
                // ),

                ElevatedButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context)=>AboutDialog(
                     applicationIcon: FlutterLogo(),
                      applicationName: "Medwell",
                      applicationVersion: "1.0.0",
                      children: [
                        Text("MedWell is an Android application that helps you track your medication intake and menstrual cycle.",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),),
                        SizedBox(height: 10,),
                        Text("Made with ❤️by medwell team!",style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),

                      ],
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    shadowColor: const Color(0xfff8f8f6),
                    primary: const Color(0xfff8f8f6),

                  ),
                  child: Container(
                    height: 60,
                    width: 380,
                    alignment: Alignment.center,
                    child:  Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        Image.asset("assets/icons/about.png",
                            width: 25,
                            height: 25,
                            color: Pallete.btnSecondary),
                        const SizedBox(width: 10), // Adjust the spacing between the prefix icon and text
                        Text(
                            "About",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,

                                height: 1.25,
                                letterSpacing: -0.16,
                                color: Color(0xff000000),
                              ),
                            )
                        ),
                        SizedBox(width: 216), // Adjust the spacing between the text and suffix icon
                        Padding(
                          padding: EdgeInsets.only(right: 10,),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 24,
                            color: Pallete.btnSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

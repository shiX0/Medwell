import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffd9d9d9),

                ),
                margin: EdgeInsets.only(top:50 ),
                // child: Image.asset("assets/images/pic.png"),
                height: 90,
                width: 90,
              ),
              SizedBox(
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
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text("20y/o.20 days streaks"),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20),
                child: const Text("NOTIFICATION SETTING",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

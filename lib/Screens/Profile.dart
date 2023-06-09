import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/CustomButton.dart';
import 'package:medwell/Components/Palette.dart';

import '../Components/ProfileButton.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Center(
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
                ProfileButtonWidget(btntitle: 'Setting',icon:"assets/icons/setting.png",width: 160,),
                SizedBox(height: 15,),
                ProfileButtonWidget(btntitle: 'Profile',icon:"assets/icons/profile.png",width: 160,),
                SizedBox(height: 15,),
                ProfileButtonWidget(btntitle: 'Preference',icon:"assets/icons/Vector.png",width: 140,),
                SizedBox(height: 15,),
                ProfileButtonWidget(btntitle: 'About',icon:"assets/icons/Vector.png",width: 160,),
                SizedBox(height: 15,),
                ProfileButtonWidget(btntitle: 'Log out',icon:"assets/icons/logout.png",width: 160,),
                SizedBox(height: 15,),

          ],
            ),

          ),
        ),
      ),
      
    );
    
  }
}



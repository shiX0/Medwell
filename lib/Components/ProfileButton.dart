import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/Palette.dart';

import 'Palette.dart';

class ProfileButtonWidget extends StatelessWidget {
   ProfileButtonWidget({this.primaryIcon,this.suffixIcon,required this.btntitle,this.width,this.icon, super.key}

  );
  IconData? primaryIcon;
   IconData? suffixIcon;
  final String? btntitle;
  String? icon;
  double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        shadowColor: const Color(0xfff8f8f6),
        primary: const Color(0xfff8f8f6),
      ),
      child: Container(
        height: 60,
        width: 350,
        alignment: Alignment.center,
        child:  Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 0,
            ),
            Icon(
                primaryIcon,
                size: 25,
                color: Pallete.btnSecondary
            ),
            Image.asset(icon!,
                width: 25,
                height: 25,
                color: Pallete.btnSecondary),
            const SizedBox(width: 20), // Adjust the spacing between the prefix icon and text
            Text(
                btntitle!,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,

                    height: 1.25,
                    letterSpacing: -0.16,
                    color: Color(0xff000000),
                  ),
                )
            ),
             SizedBox(width: width), // Adjust the spacing between the text and suffix icon
             Padding(
              padding: EdgeInsets.only(right: 10,),
              child: Icon(
                suffixIcon,
                size: 24,
                color: Pallete.btnSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
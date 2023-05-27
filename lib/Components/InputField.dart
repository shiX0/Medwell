import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pallete.dart';

class CustomTextInputField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  const CustomTextInputField({Key? key,required this.hintText, required this.keyboardType}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 60,
      decoration: BoxDecoration(
        color: Pallete.accent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.labelMedium,
            color: Colors.black54,
            fontWeight: FontWeight.w400,
            fontSize: 16
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.labelMedium,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
              fontSize: 16
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        ),
      ),
    );
  }
}

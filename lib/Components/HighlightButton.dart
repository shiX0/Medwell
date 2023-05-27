import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String label;

  const CustomTextButton({Key? key,required this.label}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      style: TextButton.styleFrom(
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.labelMedium,
            color: Color(0xFF7173A7),
            fontWeight: FontWeight.w400,
            fontSize: 16
        ),
      ),
    );
  }
}

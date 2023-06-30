import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/Palette.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;

  const CustomTextButton({Key? key,required this.label,this.onPressed}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.labelMedium,
            color: Pallete.highlight,
            fontWeight: FontWeight.w400,
            fontSize: 16
        ),
      ),
    );
  }
}

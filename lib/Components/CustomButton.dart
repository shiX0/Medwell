import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButton extends StatelessWidget {
  final String buttonText;
  const GradientButton({Key? key,required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow:const [BoxShadow(
            color: Color(0xFFFFC0C0),
            offset: Offset(0, 8),
            blurRadius:24,
          ),
          ]
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(330, 60),
          backgroundColor: Color(0xFFFFBDBD),
          elevation: 8,
        ),
        child: Text(
          buttonText,
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.headlineMedium,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  final String label;
  final String imagePath;

  const SocialButton({Key? key,required this.label, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 60,
      child: ElevatedButton(
        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFE6E6E6), // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 30,
              width: 30,
            ),
            SizedBox(width: 60),
            Text(
              label,
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.labelMedium,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}

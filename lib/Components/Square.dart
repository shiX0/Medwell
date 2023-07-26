import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/Palette.dart';
import 'package:medwell/Screens/MedsOnClickPage.dart';

class Square extends StatelessWidget {
  final String data;
  final String time;
  final Function(String) onTap;

  const Square(
      {Key? key, required this.data, required this.onTap, this.time = "okay"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(data),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/icons/Group 2.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 5),
                    child: Column(
                      children: [
                        Center(
                          child: Text(data,
                              style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                        Text(time,
                            style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                color: Pallete.btnSecondary,
                                fontWeight: FontWeight.w400,
                                fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.keyboard_arrow_right,
                    color: Pallete.btnSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

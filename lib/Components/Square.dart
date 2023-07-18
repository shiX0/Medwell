import 'package:flutter/material.dart';
import 'package:medwell/Screens/MedsOnClickPage.dart';

class Square extends StatelessWidget {
  final String data;
  final Function(String) onTap;

  const Square({Key? key, required this.data, required this.onTap}) : super(key: key);

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
          child: Center(
            child: Text(data),
          ),
        ),
      ),
    );
  }
}

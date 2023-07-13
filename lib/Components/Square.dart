import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const Square({Key? key, required this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Assign the onTap callback to GestureDetector's onTap
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(child as String),
          ),
        ),
      ),
    );
  }
}

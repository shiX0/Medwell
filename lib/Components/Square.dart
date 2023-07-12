import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final Widget child;

  const Square({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 235,235,235),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(child as String),
        ),
      ),
    );
  }
}

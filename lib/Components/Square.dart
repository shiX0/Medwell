import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final String data;
  final VoidCallback? onTap;

  const Square({Key? key, required this.data, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/icons/Group 2.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(data),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

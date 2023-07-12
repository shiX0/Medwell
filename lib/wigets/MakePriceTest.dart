import 'package:flutter/material.dart';

class MakePriceTest extends StatelessWidget {
  MakePriceTest({Key? key, required this.price}) : super(key: key);
  String price ="";

  @override
  Widget build(BuildContext context) {
    return Text("rs."+ price);
  }
}

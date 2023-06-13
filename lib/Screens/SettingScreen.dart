import 'package:flutter/material.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffd9d9d9),

                ),
                margin: EdgeInsets.only(top:50 ),
                // child: Image.asset("assets/images/pic.png"),
                height: 90,
                width: 90,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),

        ),
      ),
    );
  }
}

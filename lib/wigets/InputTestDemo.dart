import 'package:flutter/material.dart';

class InputTestDemo extends StatefulWidget {
  const InputTestDemo({super.key});

  @override
  State<InputTestDemo> createState() => _InputTestDemoState();
}

class _InputTestDemoState extends State<InputTestDemo> {
  TextEditingController controller= new TextEditingController();
  String text ="";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: Key("input-form"),
          controller: controller,),
        Text("Output : "+text),
        ElevatedButton(
            key: Key("button-press"),
            onPressed: (){
          setState(() {
            text= controller.text;
          });
        }, child: Text("save"))
      ],
    );
  }
}

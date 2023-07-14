import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medwell/wigets/InputTestDemo.dart';
import 'package:medwell/wigets/MakePriceTest.dart';


void main() {
  testWidgets('Test is make rs text', (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: Material(
        child: MakePriceTest(price: "100"),
      ),
    ));
    final textFinder = find.text("rs. 100");
    expect(textFinder, findsOneWidget);


  });
  testWidgets("Test to check input and button", (widgetTester) async{
    await widgetTester.pumpWidget(MaterialApp(
      home: Material(
        child: InputTestDemo(),
      ),
    ));
    await widgetTester.enterText(find.byKey(Key("input-form")),"xyz");

    await widgetTester.tap(find.byKey(Key("button-press")));

    final textFinder= find.text("Output: xyz");

    expect(textFinder, findsOneWidget);


  });
}

import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test to add two numbers", () {
    final actual = addnumber(2, 3);
    final expected = 5;
    expect(actual, expected);
  });
  test("test to check the data type", () {
    final responce = addnumber(10, 20);
    final actual = responce.runtimeType;
    final expected = int;
    expect(actual, expected);
  });
}
int addnumber(int x,int y){
  return x+y;
}
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medwell/models/UserModel.dart';
import 'package:medwell/repositories/UserRepository.dart';
import 'package:medwell/services/firebase_service.dart';

void main() {
  FirebaseService.db = FakeFirebaseFirestore();
  final UserRepository userRepository = UserRepository();
  final User genericUser = User(
      email: "User@mail.com",
      id: "1234",
      firstName: "John",
      lastName: "doe",
      gender: "male",
      dob: "2006");

  test("test to add user data", () async {
    final response = await userRepository.addUser(genericUser);
    final data = await response.get();
    final actual = data.data().email.toString();
    const expected = "User@mail.com";
    expect(actual, expected);
  });

  test("test to update user", () async{
    final updatedUser=User(
        email: "UpdatedUser@mail.com",
        id: "1234",
        firstName: "Jenifer",
        lastName: "doe",
        gender: "female",
        dob: "2006");
    await userRepository.updateUser(genericUser.id, updatedUser);
    final response=await userRepository.getUser(updatedUser.id);
    expect(response!.email.toString(), updatedUser.email);
  });
  
  test("test to get user", () async{
    const nonExisting="13456787";
    final response=await userRepository.getUser(nonExisting);
    expect(response, isNull);
  });
}
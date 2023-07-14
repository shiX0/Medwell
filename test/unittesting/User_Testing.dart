import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:medwell/models/UserModel.dart';
import 'package:medwell/repositories/AuthRepository.dart';
import 'package:medwell/services/firebase_service.dart';

void main() {
  FirebaseService.db = FakeFirebaseFirestore();
  final AuthRepository authRepository = AuthRepository();
  final UserModel genericUser = UserModel(
      email: "User@mail.com",
      id: "1234",
      firstName: "John",
      lastName: "doe",
      gender: "male",
      dob: "2006");

  test("test to add user data", () async {
    final response = await authRepository.addUserDetails(genericUser);
    const expected = "User@mail.com";
    final data = await response.get();
    final actual = data.data().email.toString();
    expect(actual, expected);
  });

  test("test to update user - updates user details correctly", () async {
    // Create a new user
    final user = UserModel(
      email: "user@mail.com",
      id: "123",
      firstName: "John",
      lastName: "Doe",
      gender: "male",
      dob: "2000-01-01",
    );

    // Add the user to Firestore
    await authRepository.addUserDetails(user);

    // Create updated user details
    final updatedUser = UserModel(
      email: "updated@mail.com",
      id: "1235",
      firstName: "Jane",
      lastName: "Doe",
      gender: "female",
      dob: "1995-05-10",
    );
    // Update the user details in Firestore
    await authRepository.updateUserDetail(user.id, updatedUser);

    // Retrieve the updated user details from Firestore
    final retrievedUser = await authRepository.getUserDetail(updatedUser.id);

    // Verify that the user details have been updated correctly
    expect(retrievedUser.email, updatedUser.email);
    expect(retrievedUser.firstName, updatedUser.firstName);
    expect(retrievedUser.lastName, updatedUser.lastName);
    expect(retrievedUser.gender, updatedUser.gender);
    expect(retrievedUser.dob, updatedUser.dob);
  });


  test("test to get user", () async{
    const nonExisting="13456787";
    expect(
          () async => await authRepository.getUserDetail(nonExisting),
      throwsA(isA<StateError>()),
    );
  });

  test("test to delete user", () async{
    await authRepository.addUserDetails(genericUser);
    await authRepository.deleteUserDetail(genericUser.id);
    final responce=await authRepository.getUserDetail(genericUser.id);
     expect(responce.email, genericUser.email);
  });
}
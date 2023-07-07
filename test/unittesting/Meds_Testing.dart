import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medwell/models/MedsModel.dart';
import 'package:medwell/repositories/MedsRepository.dart';
import 'package:medwell/services/firebase_service.dart';

void main(){
  FirebaseService.db=FakeFirebaseFirestore();
  final MedsRepository medsRepository=MedsRepository();
  test("test to add meds", ()async{
    final response=await medsRepository.addMeds(MedsModel(
      medname: "synax",
      medamount: 2,
    ));
    final data=await response.get();
    print(data);
    final actual=data.data()!.medname.toString();
    final expected="synax";
    expect(actual, expected);
  });
}
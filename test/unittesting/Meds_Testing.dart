import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:medwell/repositories/MedsRepository.dart';
import 'package:medwell/services/firebase_service.dart';

void main(){
  FirebaseService.db=FakeFirebaseFirestore();
  final MedsRepository medsRepository=MedsRepository();
}
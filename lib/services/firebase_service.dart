import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService{
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore db = FirebaseFirestore.instance;
  // static Reference storageRef = FirebaseStorage.instance.ref();
}
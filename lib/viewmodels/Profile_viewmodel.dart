import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medwell/services/firebase_service.dart';

import '../models/UserModel.dart';
import '../repositories/UserRepository.dart';

class ProfireViewModel with ChangeNotifier{
  UserRepository _userRepository= UserRepository();
  final _auth=FirebaseService.firebaseAuth.currentUser;
  User? _Profile;
  User? get profile => _Profile;

  Future<void> fetchProfile() async{
    try{
      final responce = await _userRepository.getUser(_auth?.uid);
      _Profile = responce;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medwell/services/firebase_service.dart';

import '../models/UserModel.dart';
import '../repositories/UserRepository.dart';

class ProfileViewModel with ChangeNotifier{
  UserRepository _userRepository= UserRepository();
  final _auth=FirebaseService.firebaseAuth.currentUser;
  User? _profile;
  User? get profile => _profile;

  Future<void> fetchProfile() async{
    try{
      final responce = await _userRepository.getUser(_auth?.uid);
      _profile = responce;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
  Future<void> updateProfile(User user) async{
    try{
      await _userRepository.updateUser(_auth?.uid, user);
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
}
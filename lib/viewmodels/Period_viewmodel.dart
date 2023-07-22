import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medwell/repositories/PeriodRepository.dart';

import '../models/PeriodModel.dart';
import '../services/firebase_service.dart';

class PeriodViewModel with ChangeNotifier{
  final User? _user = FirebaseService.firebaseAuth.currentUser;
  User? get user => _user;
  PeriodModel? _periodModel;
  PeriodModel? get periodDetails=>_periodModel;

  Future<void> getPeriodData() async{
    try{
       _periodModel=await PeriodRepository().getPeriodDetail(_user?.uid);
      notifyListeners();
    }catch(e){
      rethrow;
    }
  }
  Future<void> editPeriodData(PeriodModel data)async{
    try{
      var response= await PeriodRepository().updatePeriodDetail(data.periodId, data);
      notifyListeners();
    }catch(e){
      rethrow;
    }

  }
  Future<void> addPeriodData(PeriodModel data)async{
    try{
      var response= await PeriodRepository().addPeriodDetails(data);
      notifyListeners();
    }catch(e){
      rethrow;
    }
  }


}
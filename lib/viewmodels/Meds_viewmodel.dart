import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/MedsModel.dart';
import '../repositories/MedsRepository.dart';


class MedsViewModel with ChangeNotifier {
  MedsRepository _MedsRepository = MedsRepository();
  List<MedsModel> _Meds = [];
  List<MedsModel> get Meds => _Meds;

  Future<void> getMeds() async{
    _Meds=[];
    notifyListeners();
    try{
      var response = await _MedsRepository.getAllMeds();
      for (var element in response) {
        print(element.id);
        _Meds.add(element.data());
      }
      notifyListeners();
    }catch(e){
      print(e);
      _Meds = [];
      notifyListeners();
    }
  }


  Future<void> addMeds(MedsModel Meds) async{
    try{
      var response = await _MedsRepository.addMeds(Meds);
    }catch(e){
      notifyListeners();
    }
  }

}

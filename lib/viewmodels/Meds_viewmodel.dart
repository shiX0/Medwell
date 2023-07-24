import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/MedsModel.dart';
import '../repositories/MedsRepository.dart';
import '../services/firebase_service.dart';

class MedsViewModel with ChangeNotifier {
  final User? _user = FirebaseService.firebaseAuth.currentUser;
  User? get user => _user;
  MedsRepository _medsRepository = MedsRepository();
  List<MedsModel> _meds = [];
  List<MedsModel> get meds => _meds;
  MedsModel? _selectedMed;
  MedsModel? get selectedMed => _selectedMed;

  Future<void> getAllMeds() async {
    try {
      var response = await _medsRepository.getAllMeds( _user?.uid);
      _meds = response.map((element) => element.data()).toList();
      notifyListeners();
    } catch (e) {
      print(e);
      _meds = [];
      notifyListeners();
    }
  }

  Future<void> getOneMeds(String id) async {
    try {
      var response = await _medsRepository.getOneMeds(id);
      if (response != null) {
        _selectedMed = response.data();
        notifyListeners();
      }
    } catch (e) {
      print(e);
      _selectedMed = null;
      notifyListeners();
    }
  }

  Future<void> addMeds(MedsModel meds) async {
    try {
      await _medsRepository.addMeds(meds);
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<void> updateMeds(String id, MedsModel data) async {
    try {
      await _medsRepository.updateMeds(id, data);
      await getAllMeds();
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<void> deleteMeds(String id) async {
    try {
      await _medsRepository.deleteMeds(id);
      await getAllMeds();
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}

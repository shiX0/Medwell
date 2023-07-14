import 'package:flutter/cupertino.dart';
import '../models/MedsModel.dart';
import '../repositories/MedsRepository.dart';

class MedsViewModel with ChangeNotifier {
  MedsRepository _medsRepository = MedsRepository();
  List<MedsModel> _meds = [];
  List<MedsModel> get meds => _meds;
  MedsModel? _selectedMed;
  MedsModel? get selectedMed => _selectedMed;

  Future<void> getAllMeds() async {
    _meds = [];
    notifyListeners();
    try {
      var response = await _medsRepository.getAllMeds();
      for (var element in response) {
        print(element.id);
        _meds.add(element.data());
      }
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

  Future<void> addMeds(MedsModel Meds) async {
    try {
      await _medsRepository.addMeds(Meds);
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}

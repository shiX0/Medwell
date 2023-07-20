import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medwell/models/PeriodModel.dart';
import 'package:medwell/models/PeriodModel.dart';
import 'package:medwell/models/PeriodModel.dart';

import '../services/firebase_service.dart';

class PeriodRepository {
  CollectionReference<PeriodModel> instance = FirebaseService.db.collection(
      "Period")
      .withConverter<PeriodModel>(
    fromFirestore: (snapshot, _) {
      return PeriodModel.fromFirebaseSnapshot(snapshot);
    }, toFirestore: (model, _) => model.toJson(),
  );


  Future<PeriodModel> getPeriodDetail(String? id) async {
    try {
      final response = await instance
          .where("id", isEqualTo: id).get();
      var period = response.docs.first.data();
      return period;
    } catch (err) {
      rethrow;
    }
  }
  Future<dynamic> addPeriodDetails(PeriodModel data)async{
    try{
      final period=await instance.add(data);
      return period;
    }catch(e){
      rethrow;
    }
  }

  Future<void> updatePeriodDetail(String? id, PeriodModel data) async{
    try{
      await instance.doc(id).set(data);
    }catch(e){rethrow;}
  }
  Future<void> deleteUserDetail(String? id) async{
    try{
      await instance.doc(id).delete();
    }catch(e){
      rethrow;
    }
  }


}
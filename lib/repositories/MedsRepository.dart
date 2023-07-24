import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medwell/services/firebase_service.dart';

import '../models/MedsModel.dart';


class MedsRepository{
  CollectionReference<MedsModel> instance =FirebaseService.db.collection("meds")
      .withConverter<MedsModel>(
    fromFirestore: (snapshot, _){
      return MedsModel.fromFirebaseSnapshot(snapshot);
    }, toFirestore: (model, _)=> model.toJson(),
  );

  Future<dynamic> addMeds(MedsModel data) async {
    try {
      final meds = await instance.add(data);
      data.id=meds.id;
      updateMeds(data.id, data);
      return meds;
    } catch (e) {
      rethrow;
    }
  }
  Future<void> updateMeds(String? id, MedsModel data) async{
    try{
      await instance.doc(id).set(data);
    }catch(e){rethrow;}
  }

  Future<List<QueryDocumentSnapshot<MedsModel>>> getAllMeds(String? userId) async {
    try {
      var response = await instance.where("userId", isEqualTo: userId).get();
      var meds= response.docs;
      return meds;
    } catch (e) {
      rethrow;
    }
  }


  Future<void> deleteMeds(String id) async {
    try {
      print('Deleting document with ID: $id');
      await instance.doc(id).delete();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<DocumentSnapshot<MedsModel>> getOneMeds(String id) async {
    try {
      final response = await instance.doc(id).get();
      if (!response.exists) {
        throw Exception("Meds get one med does not exist");
      }
      return response;
    } catch (err) {
      print(err);
      rethrow;
    }
  }


  Future<List<QueryDocumentSnapshot<MedsModel>>> getMyMeds(String userId) async {
    try {
      final response = await instance.where("userId", isEqualTo: userId).get();
      var meds = response.docs;
      return meds;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

}

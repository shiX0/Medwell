import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/MedsModel.dart';
import '../services/firebase_service.dart';


class MedsRepository {
  CollectionReference<MedsModel> MedsRef = FirebaseService.db.collection("Meds").withConverter<MedsModel>(
    fromFirestore: (snapshot, _) {
      return MedsModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );

  Future<List<QueryDocumentSnapshot<MedsModel>>> getAllMeds() async {
    try {
      final response = await MedsRef.get();
      var Meds = response.docs;
      return Meds;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<List<QueryDocumentSnapshot<MedsModel>>> getMedsByCategory(String id) async {
    try {
      final response = await MedsRef.where("category_id", isEqualTo: id.toString()).get();
      var Meds = response.docs;
      return Meds;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<List<QueryDocumentSnapshot<MedsModel>>> getMedsFromList(List<String> MedsIds) async {
    try {
      final response = await MedsRef.where(FieldPath.documentId, whereIn: MedsIds).get();
      var Meds = response.docs;
      return Meds;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<List<QueryDocumentSnapshot<MedsModel>>> getMyMeds(String userId) async {
    try {
      final response = await MedsRef.where("user_id", isEqualTo: userId).get();
      var Meds = response.docs;
      return Meds;
    } catch (err) {
      print(err);
      rethrow;
    }
  }


  Future<bool> removeMeds(String MedsId, String userId) async {
    try {
      final response = await MedsRef.doc(MedsId).get();
      if(response.data()!.userId !=  userId){
        return false;
      }
      await MedsRef.doc(MedsId).delete();
      return true;
    } catch (err) {
      print(err);
      rethrow;
    }
  }



  Future<DocumentSnapshot<MedsModel>> getOneMeds(String id) async {
    try {
      final response = await MedsRef.doc(id).get();
      if (!response.exists) {
        throw Exception("Meds doesnot exists");
      }
      return response;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<bool?> addMeds({required MedsModel Meds}) async {
    try {
      final response = await MedsRef.add(Meds);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool?> editMeds({required MedsModel Meds, required String MedsId}) async {
    try {
      final response = await MedsRef.doc(MedsId).set(Meds);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool?> favorites({required MedsModel Meds}) async {
    try {
      final response = await MedsRef.add(Meds);
      return true;
    } catch (err) {
      return false;
      rethrow;
    }
  }
}

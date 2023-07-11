import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medwell/services/firebase_service.dart';

import '../models/MedsModel.dart';


class MedsRepository{
  final instance =FirebaseService.db.collection("Meds").withConverter(fromFirestore: (snapshot, _){
    return MedsModel.fromFirebaseSnapshot(snapshot);
  }, toFirestore: (MedsModel model, _)=> model.toJson());

  Future<dynamic> addMeds(MedsModel data) async{
    try{
      final Meds = await instance.add(data);
      return Meds;
    }catch(e){rethrow;}
  }
  Future<List<QueryDocumentSnapshot<MedsModel>>> getAllMeds() async{
    try{
      final Meds=(await instance.get()).docs;
      return Meds;
    }catch(e){rethrow;}
  }
  Future<void> deleteMeds(String id) async{
    try{
      await instance.doc(id).delete();

    }catch(e){
      rethrow;
    }
  }
  Future<MedsModel?> getOneMeds(String id) async{
    try{
      final Meds=(await instance.doc(id).get()).data();
      return Meds;
    }catch(e){
      rethrow;
    }
  }
  Future<void> updateMeds(String id, MedsModel data) async{
    try{
      await instance.doc(id).set(data);
    }catch(e){rethrow;}
  }
}
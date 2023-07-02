import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/MedsModel.dart';


class MedsRepository{
  final instance =FirebaseFirestore.instance.collection("Meds").withConverter(fromFirestore: (snapshot, _){
    return MedsModel.fromFirebaseSnapshot(snapshot);
  }, toFirestore: (MedsModel model, _)=> model.toJson());

  Future<void> addMeds(MedsModel data) async{
    try{
      final Meds = await instance.add(data);

    }catch(e){rethrow;}
  }
  Future<List<QueryDocumentSnapshot<MedsModel>>> getAllMeds() async{
    try{
      final products=(await instance.get()).docs;
      return products;
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
      final product=(await instance.doc(id).get()).data();
      return product;
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
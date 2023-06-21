import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/MedsModel.dart';


class medicationRepository{
  final instance =FirebaseFirestore.instance.collection("medication").withConverter(fromFirestore: (snapshot, _){
    return MedsModel.fromFirebaseSnapshot(snapshot);
  }, toFirestore: (MedsModel model, _)=> model.toJson());

  Future<void> createmedication(MedsModel data) async{
    try{
      final medication = await instance.add(data);

    }catch(e){rethrow;}
  }
  Future<List<QueryDocumentSnapshot<MedsModel>>> getAllmedication() async{
    try{
      final medication=(await instance.get()).docs;
      return medication;
    }catch(e){rethrow;}
  }
  Future<void> detelemedication(String id) async{
    try{
      await instance.doc(id).delete();
    }catch(e){
      rethrow;
    }
  }
  Future<MedsModel?> getOnemedication(String id) async{
    try{
      final medication=(await instance.doc(id).get()).data();
      return medication;
    }catch(e){
      rethrow;
    }
  }
  Future<void> updatemedication(String id, MedsModel data) async{
    try{
      await instance.doc(id).set(data);
    }catch(e){rethrow;}
  }
}
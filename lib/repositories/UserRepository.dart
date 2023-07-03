import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medwell/services/firebase_service.dart';

import '../models/UserModel.dart';

class UserRepository{
  final instance = FirebaseService.db
      .collection("User")
      .withConverter<User>(
    fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
    toFirestore: (model, _) => model.toJson(),
  );
  Future<dynamic> addUser(User user) async{
    try{
      final userDetail = await instance.add(user);
      return userDetail;
    }catch(e){rethrow;}
  }
  Future<void> updateUser(String id, User data) async{
    try{
      await instance.doc(id).set(data);
    }catch(e){rethrow;}
  }
  Future<void> deleteUser(String id) async{
    try{
      await instance.doc(id).delete();
    }catch(e){
      rethrow;
    }
  }
  Future<User?> getUser(String id) async{
    try{
      final user=(await instance.doc(id).get()).data();
      return user;
    }catch(e){
      rethrow;
    }
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/UserModel.dart';

class UserRepository{
  final instance = FirebaseFirestore.instance
      .collection("User")
      .withConverter<User>(
    fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
    toFirestore: (model, _) => model.toJson(),
  );
  Future<void> addUser(User user) async{
    try{
      final User = await instance.add(user);
    }catch(e){rethrow;}
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/UserModel.dart';

class ProfireViewModel with ChangeNotifier{
  DocumentSnapshot<User>? _Profile;
  DocumentSnapshot<User>? get profile => _Profile;

}
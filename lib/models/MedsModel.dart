import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

MedsModel? MedsModelFromJson(String str) => MedsModel.fromJson(json.decode(str));

String MedsModelToJson(MedsModel? data) => json.encode(data!.toJson());

class MedsModel {
  MedsModel({
    this.medname,
    this.medamount,
    this.medtype,
    this.meddays,
    this.daytype,
    this.timing,
    this.notitimes,
    this.id,
    this.userId,
  });

  String? medname;
  num? medamount;
  String? medtype;
  num? meddays;
  String? daytype;
  String? timing;
  List<DateTime>? notitimes;
  String? id;
  String? userId;

  factory MedsModel.fromJson(Map<String, dynamic> json) => MedsModel(
    medname: json["medname"],
    medamount: json["medamount"]?.toDouble(),
    medtype: json["medtype"],
    meddays: json["meddays"]?.toDouble(),
    daytype: json["daytype"],
    timing: json["timing"],
    notitimes: (json["notitimes"] as List<dynamic>).map((time) => (time as Timestamp).toDate()).toList(),
    id: json["id"],
    userId: json["userId"],
  );

  factory MedsModel.fromFirebaseSnapshot(DocumentSnapshot<Map<String, dynamic>> json) => MedsModel(
        id: json.id,
        userId: json["userId"],
        medname: json["medname"],
        medamount: json["medamount"]?.toDouble(),
        medtype: json["medtype"],
        meddays: json["meddays"]?.toDouble(),
        daytype: json["daytype"],
        timing: json["timing"],
        notitimes: (json["notitimes"] as List<dynamic>).map((time) => (time as Timestamp).toDate()).toList(),
      );

  Map<String, dynamic> toJson() => {
    "medname": medname,
    "medamount": medamount,
    "medtype": medtype,
    "meddays": meddays,
    "daytype": daytype,
    "timing": timing,
    "notitimes": notitimes!.map((time) => Timestamp.fromDate(time)).toList(),
    "id": id,
    "userId": userId,
  };
}

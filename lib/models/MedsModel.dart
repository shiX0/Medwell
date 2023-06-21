// To parse this JSON data, do
//
//     final MedsModel = MedsModelFromJson(jsonString);
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

MedsModel MedsModelFromJson(String str) => MedsModel.fromJson(json.decode(str));

String MedsModelToJson(MedsModel data) => json.encode(data.toJson());

class MedsModel {
  String? medname;
  double? nomeds;
  String? medtype;
  int? meddays;
  String? daytype;
  String? timing;
  String? notitimes;
  String? id;

  MedsModel({
    this.medname,
    this.nomeds,
    this.medtype,
    this.meddays,
    this.daytype,
    this.timing,
    this.notitimes,
    this.id,
  });

  factory MedsModel.fromJson(Map<String, dynamic> json) => MedsModel(
    medname: json["medname"],
    nomeds: json["nomeds"]?.toDouble(),
    medtype: json["medtype"],
    meddays: json["meddays"]?.toInt(),
    daytype: json["daytype"],
    timing: json["timing"],
    notitimes: json["notitimes"],
    id: json["id"],
  );

  factory MedsModel.fromFirebaseSnapshot(DocumentSnapshot doc){
    final data = doc.data()! as Map<String, dynamic>;
    data["id"]=doc.id;
    return MedsModel.fromJson(data);
  }
  Map<String, dynamic> toJson() => {
    "medname": medname,
    "nomeds": nomeds,
    "medtype":medtype,
    "meddays":meddays,
    "daytype":daytype,
    "timing":timing,
    "notitimes":notitimes,
    "id": id,
  };
}

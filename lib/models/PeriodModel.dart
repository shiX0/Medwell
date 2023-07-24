// To parse this JSON data, do
//
//     final periodModel = periodModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

PeriodModel UserModelFromJson(String str) => PeriodModel.fromJson(json.decode(str));

String UserModelToJson(PeriodModel data) => json.encode(data.toJson());


class PeriodModel {
  String? selectDate;
  int? cycleLength;
  int? periodLength;
  String? nextPeriod;
  String? currentCycle;
  String? userId;
  String? periodId;

  PeriodModel({
    this.selectDate,
    this.cycleLength,
    this.periodLength,
    this.nextPeriod,
    this.currentCycle,
    this.userId,
    this.periodId,
  });

  factory PeriodModel.fromRawJson(String str) => PeriodModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PeriodModel.fromJson(Map<String, dynamic> json) => PeriodModel(
    selectDate: json["selectDate"],
    cycleLength: json["cycleLength"],
    periodLength: json["periodLength"],
    nextPeriod: json["nextPeriod"],
    currentCycle: json["currentCycle"],
    userId: json["userId"],
    periodId: json["periodId"],
  );
  factory PeriodModel.fromFirebaseSnapshot(DocumentSnapshot<Map<String, dynamic>> json) => PeriodModel(
    selectDate: json["selectDate"],
    cycleLength: json["cycleLength"],
    periodLength: json["periodLength"],
    nextPeriod: json["nextPeriod"],
    currentCycle: json["currentCycle"],
    userId: json["userId"],
    periodId: json["periodId"],
  );

  Map<String, dynamic> toJson() => {
    "selectDate": selectDate,
    "cycleLength": cycleLength,
    "periodLength": periodLength,
    "nextPeriod": nextPeriod,
    "currentCycle": currentCycle,
    "userId": userId,
    "periodId": periodId,
  };
}

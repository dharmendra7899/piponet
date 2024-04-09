// To parse this JSON data, do
//
//     final searchTrainDataModal = searchTrainDataModalFromJson(jsonString);

import 'dart:convert';

SearchTrainDataModal searchTrainDataModalFromJson(String str) =>
    SearchTrainDataModal.fromJson(json.decode(str));

String searchTrainDataModalToJson(SearchTrainDataModal data) =>
    json.encode(data.toJson());

class SearchTrainDataModal {
  bool? status;
  String? message;
  int? timestamp;
  List<Datum>? data;

  SearchTrainDataModal({
    this.status,
    this.message,
    this.timestamp,
    this.data,
  });

  factory SearchTrainDataModal.fromJson(Map<String, dynamic> json) =>
      SearchTrainDataModal(
        status: json["status"],
        message: json["message"],
        timestamp: json["timestamp"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "timestamp": timestamp,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? trainNumber;
  String? trainName;
  String? engTrainName;
  String? newTrainNumber;

  Datum({
    this.trainNumber,
    this.trainName,
    this.engTrainName,
    this.newTrainNumber,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        trainNumber: json["train_number"],
        trainName: json["train_name"],
        engTrainName: json["eng_train_name"],
        newTrainNumber: json["new_train_number"],
      );

  Map<String, dynamic> toJson() => {
        "train_number": trainNumber,
        "train_name": trainName,
        "eng_train_name": engTrainName,
        "new_train_number": newTrainNumber,
      };
}

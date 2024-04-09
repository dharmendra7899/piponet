// To parse this JSON data, do
//
//     final fareEnquiryDataModal = fareEnquiryDataModalFromJson(jsonString);

import 'dart:convert';

FareEnquiryDataModal fareEnquiryDataModalFromJson(String str) =>
    FareEnquiryDataModal.fromJson(json.decode(str));

String fareEnquiryDataModalToJson(FareEnquiryDataModal data) =>
    json.encode(data.toJson());

class FareEnquiryDataModal {
  bool? status;
  String? message;
  int? timestamp;
  Data? data;

  FareEnquiryDataModal({
    this.status,
    this.message,
    this.timestamp,
    this.data,
  });

  factory FareEnquiryDataModal.fromJson(Map<String, dynamic> json) =>
      FareEnquiryDataModal(
        status: json["status"],
        message: json["message"],
        timestamp: json["timestamp"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "timestamp": timestamp,
        "data": data?.toJson(),
      };
}

class Data {
  List<General>? general;
  List<General>? tatkal;

  Data({
    this.general,
    this.tatkal,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        general: json["general"] == null
            ? []
            : List<General>.from(
                json["general"]!.map((x) => General.fromJson(x))),
        tatkal: json["tatkal"] == null
            ? []
            : List<General>.from(
                json["tatkal"]!.map((x) => General.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "general": general == null
            ? []
            : List<dynamic>.from(general!.map((x) => x.toJson())),
        "tatkal": tatkal == null
            ? []
            : List<dynamic>.from(tatkal!.map((x) => x.toJson())),
      };
}

class General {
  String? classType;
  dynamic fare;
  List<Breakup>? breakup;

  General({
    this.classType,
    this.fare,
    this.breakup,
  });

  factory General.fromJson(Map<String, dynamic> json) => General(
        classType: json["classType"],
        fare: json["fare"],
        breakup: json["breakup"] == null
            ? []
            : List<Breakup>.from(
                json["breakup"]!.map((x) => Breakup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "classType": classType,
        "fare": fare,
        "breakup": breakup == null
            ? []
            : List<dynamic>.from(breakup!.map((x) => x.toJson())),
      };
}

class Breakup {
  String? title;
  String? key;
  int? cost;

  Breakup({
    this.title,
    this.key,
    this.cost,
  });

  factory Breakup.fromJson(Map<String, dynamic> json) => Breakup(
        title: json["title"],
        key: json["key"],
        cost: json["cost"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "key": key,
        "cost": cost,
      };
}

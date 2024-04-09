// To parse this JSON data, do
//
//     final seatAvailabilityDataModal = seatAvailabilityDataModalFromJson(jsonString);

import 'dart:convert';

SeatAvailabilityDataModal seatAvailabilityDataModalFromJson(String str) =>
    SeatAvailabilityDataModal.fromJson(json.decode(str));

String seatAvailabilityDataModalToJson(SeatAvailabilityDataModal data) =>
    json.encode(data.toJson());

class SeatAvailabilityDataModal {
  bool? status;
  String? message;
  int? timestamp;
  List<Datum>? data;

  SeatAvailabilityDataModal({
    this.status,
    this.message,
    this.timestamp,
    this.data,
  });

  factory SeatAvailabilityDataModal.fromJson(Map<String, dynamic> json) =>
      SeatAvailabilityDataModal(
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
  int? ticketFare;
  int? cateringCharge;
  dynamic altCnfSeat;
  int? totalFare;
  String? date;
  String? confirmProbabilityPercent;
  String? confirmProbability;
  String? currentStatus;

  Datum({
    this.ticketFare,
    this.cateringCharge,
    this.altCnfSeat,
    this.totalFare,
    this.date,
    this.confirmProbabilityPercent,
    this.confirmProbability,
    this.currentStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        ticketFare: json["ticket_fare"],
        cateringCharge: json["catering_charge"],
        altCnfSeat: json["alt_cnf_seat"],
        totalFare: json["total_fare"],
        date: json["date"],
        confirmProbabilityPercent: json["confirm_probability_percent"],
        confirmProbability: json["confirm_probability"],
        currentStatus: json["current_status"],
      );

  Map<String, dynamic> toJson() => {
        "ticket_fare": ticketFare,
        "catering_charge": cateringCharge,
        "alt_cnf_seat": altCnfSeat,
        "total_fare": totalFare,
        "date": date,
        "confirm_probability_percent": confirmProbabilityPercent,
        "confirm_probability": confirmProbability,
        "current_status": currentStatus,
      };
}

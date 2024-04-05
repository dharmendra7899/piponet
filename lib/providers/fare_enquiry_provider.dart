import 'package:flutter/material.dart';

class FareEnquiryProvider extends ChangeNotifier {
  bool _showLoader = false;

  bool get showLoader => _showLoader;

  _setShowLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  bool isShowStatus = false;
  bool isShowPNR = false;
  String fromStation = 'Salem JN -SA';
  String toStation = 'Mumbai Central - BCT';

  var fromStationList = [
    'Salem JN -SA',
    'Delhi',
    'Pune',
    'Chennai',
    'Kolkata',
  ];
  var toStationList = [
    'Mumbai Central - BCT',
    'Kolkata',
    'Chennai',
  ];

  List<dynamic> ticketList = [
    {"image": "assets/images/live.png", "title": "Live \nStatus"},
    {"image": "assets/images/route.png", "title": "Route / \nSchedule"},
    {"image": "assets/images/seat.png", "title": "Seat \nAvailability"},
    {"image": "assets/images/prediction.png", "title": "Seat \nPrediction"},
  ];

  var days = [
    "Sun",
    "Mon",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];
  var seats = [
    "1A",
    "2A",
    "3A",
    "3E",
    "CC",
    "FC",
    "SL",
    "2S",
  ];
}

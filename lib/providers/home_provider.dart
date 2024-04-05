import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool _showLoader = false;

  bool get showLoader => _showLoader;

  _setShowLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  List<dynamic> ticketList = [
    {"image": "assets/images/live.png", "title": "Live \nStatus"},
    {"image": "assets/images/pnr.png", "title": "PNR \nStatus"},
    {"image": "assets/images/fare.png", "title": "Fare \nEnquiry"},
    {"image": "assets/images/train.png", "title": "Search \nTrains"},
    {"image": "assets/images/seat.png", "title": "Seat \nAvailability"},
    {"image": "assets/images/route.png", "title": "Route / \nSchedule"},
    {"image": "assets/images/map.png", "title": "Seat \nMap"},
    // {"image": "assets/images/more.png", "title": "More"},
  ];

  List<dynamic> rechargeList = [
    {"image": "assets/images/recharge.png", "title": "Mobile \nRecharge"},
    {"image": "assets/images/mobile.png", "title": "Mobile \nPostpaid"},
    {"image": "assets/images/dth.png", "title": "DTH \nRecharge"},
    {"image": "assets/images/fast.png", "title": "FASTag \nRecharge"},
    {"image": "assets/images/ott1.png", "title": "OTT \nRecharge"},
    {"image": "assets/images/more1.png", "title": "More"},
  ];
}

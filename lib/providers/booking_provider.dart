import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
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
    {"image": "assets/images/more.png", "title": "More"},
  ];
}

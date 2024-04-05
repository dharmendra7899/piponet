import 'package:flutter/material.dart';

class RouteScheduleProvider extends ChangeNotifier {
  bool _showLoader = false;

  bool get showLoader => _showLoader;

  _setShowLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

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

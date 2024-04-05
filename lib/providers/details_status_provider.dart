import 'package:flutter/material.dart';

class DetailsStatusProvider extends ChangeNotifier {
  bool _showLoader = false;

  bool get showLoader => _showLoader;

  _setShowLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  bool isShowStatus = false;
  bool isShowPNR = false;
  String startStation = 'Lucknow';
  String startDate = 'Today';

  var stationList = [
    'Lucknow',
    'Delhi',
    'Pune',
    'Chennai',
    'Kolkata',
  ];
  var dateList = [
    'Today',
    'Yesterday',
    'Tomorrow',
  ];
}

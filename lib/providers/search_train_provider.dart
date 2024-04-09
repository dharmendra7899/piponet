import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:piponet/styles/app_colors.dart';

import '../api/api_client.dart';
import '../constants/app_urls.dart';
import '../customs/toast_message.dart';
import '../customs/validate_connectivity.dart';
import '../customs/validator.dart';
import '../models/serach_train_data_model.dart';
import '../models/server_error.dart';

class SearchTrainProvider extends ChangeNotifier {
  bool _showLoader = false;

  bool get showLoader => _showLoader;

  _setShowLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  bool isShowStatus = false;
  bool isShowPNR = false;
  String? fromStation;
  String toStation = 'Mumbai Central - BCT';
  String? trainClass;
  String date = "DD-MM-YYYY";

  SearchTrainDataModal? searchTrainDataModal;

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

  var trainClassList = [
    'FIRST AC',
    'SECOND AC',
    'THIRD AC',
    'SECOND SEATING',
    '3 AC ECONOMY',
    'AC CHAIR CAR',
    'SLEEPER CLASS',
    'FIRST CLASS',
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

  DateTime selectedDate = DateTime.now();

  Future<void> selectTrainDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 18)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: appColors.colorPrimary,
            useMaterial3: false,
            backgroundColor: Colors.white,

            // Customize other properties of the theme as needed
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      date = formatDateTime(picked.toString(), 'dd-MM-yyyy');
      notifyListeners();
    }
  }

  Future<bool> getClasses(BuildContext context) async {
    validateConnectivity(
        context: context,
        provider: () async {
          _setShowLoader(true);
          try {
            final res = await ApiClient.getApi(
              url: appUrls.classes,
              headers: {
                "Content-Type": "application/json",
                "X-RapidAPI-Key":
                    "403c003801mshfc4e97d34ba033cp1be727jsn1f2c77377341",
                "X-RapidAPI-Host": "irctc1.p.rapidapi.com"
              },
            );
            var response = jsonDecode(res);
            if (response != null && response["status"]) {
              showToast(response["message"], isSuccess: true);
              _setShowLoader(false);
              notifyListeners();
              return true;
            } else {
              showToast(response["message"], isSuccess: true);
              _setShowLoader(false);
              notifyListeners();
              return false;
            }
          } catch (e) {
            if (e is ServerError) {
              _setShowLoader(false);
              showToast(e.message.toString());
            }
          }
        });
    notifyListeners();
    _setShowLoader(false);
    return false;
  }

  Future<bool> searchTrains(BuildContext context) async {
    validateConnectivity(
        context: context,
        provider: () async {
          _setShowLoader(true);
          try {
            final res = await ApiClient.getApi(
              url: "${appUrls.searchStations}?query=190",
              headers: {
                "Content-Type": "application/json",
                "X-RapidAPI-Key":
                    "403c003801mshfc4e97d34ba033cp1be727jsn1f2c77377341",
                "X-RapidAPI-Host": "irctc1.p.rapidapi.com"
              },
            );
            debugPrint("response body=============>");
            var response = jsonDecode(res.body);
            debugPrint("response body=============> ${res.body["message"]}");
            debugPrint("response body=============> ${response["message"]}");
            debugPrint("response body=============> ${res.body}");
            if (response != null) {
              showToast(response["message"], isSuccess: true);
              _setShowLoader(false);
              // searchTrainDataModal =
              //     SearchTrainDataModal.fromJson(response.body);
              notifyListeners();
              return true;
            } else {
              showToast(
                response["message"],
              );
              _setShowLoader(false);
              notifyListeners();

              return false;
            }
          } catch (e) {
            if (e is ServerError) {
              _setShowLoader(false);
              showToast(e.message.toString());
            }
          }
        });
    notifyListeners();
    _setShowLoader(false);
    return false;
  }
}

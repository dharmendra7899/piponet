import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:piponet/models/fare_enquiry_data_model.dart';

import '../api/api_client.dart';
import '../constants/app_urls.dart';
import '../customs/navigation.dart';
import '../customs/toast_message.dart';
import '../customs/validate_connectivity.dart';
import '../customs/validator.dart';
import '../models/server_error.dart';
import '../screens/train/fareEnquiry/fareDetails.dart';
import '../styles/app_colors.dart';

class FareEnquiryProvider extends ChangeNotifier {
  bool _showLoader = false;

  bool get showLoader => _showLoader;

  _setShowLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  bool isShowStatus = false;
  bool isShowPNR = false;
  String? fromStation;
  String? toStation;

  FareEnquiryDataModal? fareEnquiryDataModal;

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

  DateTime selectedDate = DateTime.now();

  String date = "DD-MM-YYYY";

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

  Future<bool> getFareEnquiry(BuildContext context) async {
    validateConnectivity(
        context: context,
        provider: () async {
          _setShowLoader(true);
          try {
            final res = await ApiClient.getApi(
              url:
                  "${appUrls.fareEnquiry}?trainNo= 19038&fromStationCode= ST&toStationCode= BVI",
              headers: {
                "Content-Type": "application/json",
                "X-RapidAPI-Key":
                    "403c003801mshfc4e97d34ba033cp1be727jsn1f2c77377341",
                "X-RapidAPI-Host": "irctc1.p.rapidapi.com"
              },
            );
            debugPrint("response body=============>");
            var response = jsonDecode(res.body);
            if (response != null) {
              showToast(response["message"], isSuccess: true);
              _setShowLoader(false);
              fareEnquiryDataModal =
                  FareEnquiryDataModal.fromJson(response.body);
              navigateTo(
                  context: context,
                  to: FareDetails(
                    title: "Fare Details",
                  ));
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

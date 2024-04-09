import 'dart:convert';

import 'package:flutter/material.dart';

import '../api/api_client.dart';
import '../constants/app_urls.dart';
import '../customs/toast_message.dart';
import '../customs/validate_connectivity.dart';
import '../models/server_error.dart';

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

  Future<bool> getPNRStatus(BuildContext context, String pnrNumber) async {
    validateConnectivity(
        context: context,
        provider: () async {
          _setShowLoader(true);
          try {
            final res = await ApiClient.getApi(
              url: "${appUrls.pnrStatus}?pnrNumber=$pnrNumber",
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
              isShowStatus = false;
              isShowPNR = true;
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

  Future<bool> getLiveStatus(BuildContext context, String trainNumber) async {
    validateConnectivity(
        context: context,
        provider: () async {
          _setShowLoader(true);
          try {
            final res = await ApiClient.getApi(
              url: "${appUrls.liveStatus}?trainNo=$trainNumber&startDay=1",
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
              isShowStatus = true;
              isShowPNR = false;
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

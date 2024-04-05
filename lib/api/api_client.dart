// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../constants/app_urls.dart';
import '../customs/navigation.dart';
import '../customs/toast_message.dart';
import '../models/response_model.dart';
import '../models/server_error.dart';
import '../screens/auth/login.dart';

class ApiClient {
  static Future postApi(
      {BuildContext? context,
      required String url,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    debugPrint('Url: ${appUrls.baseUrl}$url');
    debugPrint('body: $body');
    headers?["Content-Type"] = "application/json";
    debugPrint('Headers: $headers');

    Response response = await post(
      Uri.parse(
        '${appUrls.baseUrl}$url',
      ),
      headers: headers,
      body: jsonEncode(body),
    );
    debugPrint("response data: ${response.body}");
    if (response.statusCode == 200) {
      // var data = CommonModalClass.fromJson(jsonDecode(response.body));
      try {
        return response.body;
      } catch (e) {
        showToast(jsonDecode(response.body)["message"]);
      }
    } else if (response.statusCode == 401) {
      navigateRemoveUntil(context: context!, to: Login());
    } else {
      throw ServerError(
          response.statusCode,
          jsonDecode(response.body)['message'] ??
              jsonDecode(response.body)['errors']);
    }
    return null;
  }

  static Future getApi(
      {BuildContext? context,
      required String url,
      Map<String, String>? headers}) async {
    debugPrint('Url: ${appUrls.baseUrl}$url');
    debugPrint('Headers: $headers');

    Response response = await get(
      Uri.parse(
        '${appUrls.baseUrl}$url',
      ),
      headers: headers,
    );
    debugPrint("data: ${response.body}");
    if (response.statusCode == 200) {
      // var data = CommonModalClass.fromJson(jsonDecode(response.body));
      return response.body;
    } else if (response.statusCode == 401) {
      navigateRemoveUntil(context: context!, to: Login());
    } else {
      throw ServerError(response.statusCode, jsonDecode(response.body)['msg']);
    }
    return null;
  }

  static Future<CommonModalClass?> putApi(
      {BuildContext? context,
      required String url,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    debugPrint('Url: ${appUrls.baseUrl}$url');
    debugPrint('body: $body');
    headers?["Content-Type"] = "application/json";
    debugPrint('Headers: $headers');

    Response response = await put(
      Uri.parse(
        '${appUrls.baseUrl}$url',
      ),
      headers: headers,
      body: jsonEncode(body),
    );
    debugPrint("data: ${response.body}");
    if (response.statusCode == 200) {
      var data = CommonModalClass.fromJson(jsonDecode(response.body));
      return data;
    } else if (response.statusCode == 401) {
      navigateRemoveUntil(context: context!, to: Login());
    } else {
      throw ServerError(response.statusCode, jsonDecode(response.body)['msg']);
    }
    return null;
  }

  static Future<CommonModalClass?> deleteApi(
      {BuildContext? context,
      required String url,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    debugPrint('Url: ${appUrls.baseUrl}$url');
    headers?["Content-Type"] = "application/json";
    debugPrint('Headers: $headers');

    Response response = await delete(
        Uri.parse(
          '${appUrls.baseUrl}$url',
        ),
        headers: headers,
        body: jsonEncode(body));
    debugPrint("data: ${response.body}");
    if (response.statusCode == 200) {
      var data = CommonModalClass.fromJson(jsonDecode(response.body));
      return data;
    } else if (response.statusCode == 401) {
      navigateRemoveUntil(context: context!, to: Login());
    } else {
      throw ServerError(response.statusCode, jsonDecode(response.body)['msg']);
    }
    return null;
  }
}

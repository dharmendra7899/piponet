import 'package:flutter/material.dart';

import 'date_formatter.dart';

bool isEmailValid(String email) {
  final RegExp emailRegExp =
      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$');
  return emailRegExp.hasMatch(email);
}

bool isNumberValid(String contactNumber) {
  final RegExp contactNumberRegExp = RegExp(r'^[0-9]{10}$');
  return contactNumberRegExp.hasMatch(contactNumber);
}

String formatDateTime(String date, String format) {
  if (DateTime.tryParse(date) != null) {
    return formatDate(date, format);
  }
  return '';
}

List<BoxShadow> boxShadow(
        {Color color = Colors.black,
        double spreadRadius = 5,
        double blurRadius = 30,
        Offset offset = const Offset(0, 3)}) =>
    [
//Color(0xff0000001a).withOpacity(0.05),
      BoxShadow(
        color: color.withOpacity(0.02),
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      ),
    ];

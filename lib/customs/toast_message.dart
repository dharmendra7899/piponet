// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/app_colors.dart';

var fToast;
showToast(String input,
    {ToastGravity? alignment = ToastGravity.BOTTOM,
    bool isSuccess = false,
    int? time,
    Color? color}) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: isSuccess ? appColors.appGray : color ?? appColors.redColor,
    ),
    child: Text(
      input,
      maxLines: 10,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Montserrat',
        color: appColors.colorBackground,
        fontSize: 14,
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: time ?? 3),
  );
}

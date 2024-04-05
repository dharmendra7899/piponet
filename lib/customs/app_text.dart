import 'package:flutter/material.dart';

Text appText(
    {required String title,
    double fontSize = 12,
    int? maxLines,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow}) {
  return Text(
    title,
    textAlign: textAlign,
    maxLines: maxLines,
    style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Inter',
        fontWeight: fontWeight,
        overflow: textOverflow,
        decoration: textDecoration),
  );
}

import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isLoading;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool? isDisabled;
  final double? fontSize;
  final double? height;
  final double borderRadius;
  final FontWeight? fontWeight;
  final Widget? widget;
  const AppButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.color,
      this.textColor,
      this.borderColor,
      this.fontSize = 16,
      this.height = 50,
      this.borderRadius = 4,
      this.widget,
      this.fontWeight = FontWeight.w400,
      this.isDisabled = false,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height,
        decoration: BoxDecoration(
          color: appColors.colorPrimary,
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ElevatedButton(
          onPressed: isLoading == true || isDisabled == true ? null : onPressed,
          style: ButtonStyle(
              surfaceTintColor: MaterialStatePropertyAll(
                isDisabled == true
                    ? appColors.colorPrimary
                    : color ?? appColors.colorPrimary,
              ),
              backgroundColor: MaterialStatePropertyAll(
                isDisabled == true
                    ? appColors.colorPrimary
                    : color ?? appColors.colorPrimary,
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              )),
          child: Center(
              child: isLoading == true
                  ? CircularProgressIndicator(
                      color: appColors.appGray,
                    )
                  : title.isNotEmpty
                      ? Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: fontSize,
                              fontFamily: 'Inter',
                              color: isDisabled == true
                                  ? appColors.colorBackground
                                  : textColor ?? appColors.colorBackground,
                              fontWeight: fontWeight),
                        )
                      : widget),
        ),
      ),
    );
  }
}

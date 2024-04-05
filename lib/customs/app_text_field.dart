import 'package:flutter/material.dart';
import 'package:piponet/customs/validator.dart';
import 'package:piponet/styles/app_colors.dart';

class AppTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? iconData;
  final Widget? leadingIcon;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool readOnly;
  final Color? borderColor;
  final TextEditingController? controller;
  final Function()? onTap;
  final String? hintText;
  final void Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool obscureText;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;
  final String? counterText;
  final double? fontSize;
  final Widget? prefixIcon;
  final TextInputType? keyBoardType;
  final TextCapitalization textCapitalization;
  final bool? enabled;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsetsGeometry contentPadding;
  final InputBorder inputBorder;
  final String obscuringCharacter;
  final TextAlign textAlign;
  final String? prefixText;
  final TextStyle? hintStyle;

  const AppTextField({
    super.key,
    this.labelText,
    this.width = 1,
    this.iconData,
    this.controller,
    this.onTap,
    this.readOnly = false,
    this.height,
    this.hintText,
    this.onChanged,
    this.hintStyle,
    this.prefixIcon,
    this.leadingIcon,
    this.initialValue,
    this.style = const TextStyle(),
    this.validator,
    this.fontSize = 14,
    this.obscureText = false,
    this.focusNode,
    this.keyBoardType,
    this.textCapitalization = TextCapitalization.sentences,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.borderColor,
    this.labelStyle,
    this.maxLength,
    this.prefixText,
    this.counterText,
    this.inputBorder = InputBorder.none,
    this.obscuringCharacter = '•',
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: w * width!,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: boxShadow()),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        textCapitalization: textCapitalization,
        enabled: enabled,
        focusNode: focusNode,
        initialValue: initialValue,
        validator: validator,
        onChanged: onChanged,
        readOnly: readOnly,
        obscureText: obscureText,
        onTap: onTap,
        textAlign: textAlign,
        keyboardType: keyBoardType,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLength: maxLength,
        maxLines: maxLines,
        enableSuggestions: true,
        style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            color: appColors.textColor),
        obscuringCharacter: obscuringCharacter,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            counterText: '',
            prefix: leadingIcon,
            prefixText: prefixText,
            filled: readOnly,
            hintText: hintText,
            hintStyle: hintStyle,
            suffixIcon: iconData,
            labelText: labelText == '' ? null : labelText,
            contentPadding: contentPadding,
            alignLabelWithHint: true,
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: .7, color: appColors.borderColor)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: .7, color: appColors.borderColor)),
            disabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: .7, color: appColors.borderColor)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: .7, color: appColors.borderColor)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: .7, color: appColors.borderColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: .7, color: appColors.borderColor))),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/app_colors.dart';

class ContainerTextFiled extends StatelessWidget {
  String hintText;
  String headingText;
  TextEditingController? controller = TextEditingController();
  Widget suffix;
  Function isValid;
  Function? onChanged;
  String errorMessage;
  bool obscureText;
  bool isPhone;
  TextCapitalization textCapitalization;
  TextInputType keyboardType;
  List<TextInputFormatter>? inputFormatters;
  bool isReadOnly;

  ContainerTextFiled(
      {Key? key,
      this.isReadOnly = false,
      this.inputFormatters,
      this.obscureText = false,
      this.isPhone = false,
      this.keyboardType = TextInputType.text,
      this.textCapitalization = TextCapitalization.none,
      this.errorMessage = "Invalid Value",
      required this.isValid(String val),
      this.onChanged(String val)?,
      this.suffix = const SizedBox(),
      this.controller,
      required this.hintText,
      required this.headingText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.7, color: appColors.borderColor),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        dense: true,
        title: Text(
          headingText,
          style: TextStyle(
            fontSize: 10,
            color: appColors.textColor,
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
        ),
        subtitle: SizedBox(
          child: TextFormField(
            readOnly: isReadOnly,
            keyboardType: keyboardType,
            obscureText: obscureText,
            inputFormatters: inputFormatters,
            textCapitalization: textCapitalization,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => isValid(value) ? null : errorMessage,
            onChanged: (value) => onChanged != null ? onChanged!(value) : {},
            controller: controller,
            cursorColor: Theme.of(context).primaryColor,
            style: TextStyle(
              color: appColors.textColor,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: appColors.redColor,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: appColors.appGray,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              errorBorder: InputBorder.none,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 0, left: 0),
              suffixIcon: suffix,
            ),
          ),
        ),
      ),
    );
    /*  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: TextFormField(
            readOnly: isReadOnly,
            keyboardType: keyboardType,
            obscureText: obscureText,
            inputFormatters: inputFormatters,
            textCapitalization: textCapitalization,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => isValid(value) ? null : errorMessage,
            onChanged: (value) => onChanged != null ? onChanged!(value) : {},
            controller: controller,
            cursorColor: Theme.of(context).primaryColor,
            style: AppFontFamily().montserrat.copyWith(
                letterSpacing: 1.5,
                fontSize: 14,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
                errorStyle: AppFontFamily().montserrat.copyWith(
                    fontSize: 13,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500),
                hintText: hintText,
                hintStyle: AppFontFamily().montserrat.copyWith(
                    fontSize: 13,
                    color: Theme.of(context).dividerColor,
                    fontWeight: FontWeight.w500),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary), //<-- SEE HERE
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: .5,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary), //<-- SEE HERE
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary), //<-- SEE HERE
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary), //<-- SEE HERE
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary), //<-- SEE HERE
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary), //<-- SEE HERE
                ),
                suffixIcon: suffix),
          ),
        )
      ],
    );*/
  }
}

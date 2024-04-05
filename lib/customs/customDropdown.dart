import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    Key? key,
    required this.hintText,
    this.showDivider = true,
    this.showSearchBar = true,
    this.isClicked = false,
    required this.dropdownHeading,
    required this.dropDownList,
    this.shouldShowBorder = true,
    this.height = 55,
    this.headingFontSize = 10,
    this.shouldShowTrailingArrow = false,
    this.imageColor = const Color(0xffE01B22),
    required this.onChange,
    required this.dropDownInitialValue,
  }) : super(key: key);

  final bool shouldShowBorder;
  final bool showDivider;
  final bool showSearchBar;
  final bool isClicked;
  final String dropdownHeading;
  final String dropDownInitialValue;
  final List<String> dropDownList;
  final String hintText;
  final Function onChange;
  final Color imageColor;
  double headingFontSize;
  final bool shouldShowTrailingArrow;
  double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: shouldShowBorder
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.7, color: appColors.borderColor),
            )
          : null,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        dense: true,
        title: Text(
          dropdownHeading,
          style: TextStyle(
            fontSize: 10,
            color: appColors.textColor,
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
        ),
        subtitle: DropdownButtonHideUnderline(
          child: DropdownButton(
            style: TextStyle(
              fontSize: 16,
              color: appColors.textColor,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ),
            hint: Text(
              hintText,
              style: TextStyle(
                color: appColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
              ),
            ),
            items: dropDownList.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            isExpanded: true,
            isDense: true,
            onChanged: (String? newValue) {
              onChange(newValue);
            },
            value: dropDownInitialValue,
          ),
        ),
      ),
    );
  }
}

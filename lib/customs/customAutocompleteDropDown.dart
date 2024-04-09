import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class CustomAutocompleteDropDown extends StatelessWidget {
  CustomAutocompleteDropDown({
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
    required this.onTextChange,
    this.dropDownInitialValue,
  }) : super(key: key);

  final bool shouldShowBorder;
  final bool showDivider;
  final bool showSearchBar;
  final bool isClicked;
  final String dropdownHeading;
  final String? dropDownInitialValue;
  final List<String> dropDownList;
  final String hintText;
  final Function onChange;
  final Function onTextChange;
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
        subtitle: Theme(
          data: ThemeData(
            useMaterial3: false,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return dropDownList.where((String option) {
                  return option
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                onChange(selection);
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  autocorrect: true,
                  onChanged: (value) {
                    onTextChange(value);
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 24),
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: appColors.appGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                      ),
                      fillColor: Colors.white),
                );
              },
            ),
          ),
        ),
        trailing: const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 20,
          ),
        ),
      ),
    );
  }
}

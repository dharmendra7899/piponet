import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../customs/app_button.dart';
import '../../../../customs/validator.dart';
import '../../../../providers/details_status_provider.dart';
import '../../../../styles/app_colors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsStatusProvider>(
        builder: (context, statusProvider, child) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        decoration: BoxDecoration(
          border: Border.all(width: 0.8, color: appColors.borderColor),
          borderRadius: BorderRadius.circular(20),
          boxShadow: boxShadow(),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140,
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(width: 0.7, color: appColors.borderColor)),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    dense: true,
                    title: Text(
                      "Start Station",
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
                          "Select Station",
                          style: TextStyle(
                            color: appColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                          ),
                        ),
                        items: statusProvider.stationList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        isExpanded: true,
                        isDense: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            statusProvider.startStation = newValue!;
                          });
                        },
                        value: statusProvider.startStation,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(width: 0.7, color: appColors.borderColor)),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    dense: true,
                    title: Text(
                      "Start Date",
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
                          "Select Date",
                          style: TextStyle(
                            color: appColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                          ),
                        ),
                        items: statusProvider.dateList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        isExpanded: true,
                        isDense: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            statusProvider.startDate = newValue!;
                          });
                        },
                        value: statusProvider.startDate,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 180,
              child: AppButton(
                onPressed: () {},
                borderRadius: 13,
                title: "Get Live Status",
                color: appColors.appGreen,
                height: 45,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                textColor: appColors.colorBackground,
              ),
            )
          ],
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../customs/app_button.dart';
import '../../../customs/app_text.dart';
import '../../../customs/customAutocompleteDropDown.dart';
import '../../../customs/toast_message.dart';
import '../../../customs/validate_connectivity.dart';
import '../../../customs/validator.dart';
import '../../../providers/fare_enquiry_provider.dart';
import '../../../styles/app_colors.dart';

class FareEnquiry extends StatefulWidget {
  const FareEnquiry({super.key});

  @override
  State<FareEnquiry> createState() => _FareEnquiryState();
}

class _FareEnquiryState extends State<FareEnquiry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.colorBackground,
      body: Consumer<FareEnquiryProvider>(
        builder: (context, fareProvider, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: appColors.colorPrimary,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                left: 10,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // statusProvider.isShowStatus = false;
                        // statusProvider.isShowPNR = false;
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: appColors.colorBackground,
                      ),
                    ),
                    appText(
                      title: "Fare Enquiry",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: appColors.colorBackground,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.17,
                left: 0,
                right: 0,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 25),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.8, color: appColors.borderColor),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: boxShadow(),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              CustomAutocompleteDropDown(
                                dropdownHeading: "From",
                                dropDownInitialValue: fareProvider.fromStation,
                                dropDownList: fareProvider.fromStationList,
                                hintText: "Select from station",
                                height: 55,
                                onTextChange: (val) {},
                                onChange: (val) {
                                  setState(() {
                                    fareProvider.fromStation = val.toString();
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomAutocompleteDropDown(
                                dropdownHeading: "To",
                                dropDownInitialValue: fareProvider.toStation,
                                dropDownList: fareProvider.toStationList,
                                hintText: "Select to station",
                                height: 55,
                                onTextChange: (val) {},
                                onChange: (val) {
                                  setState(() {
                                    fareProvider.toStation = val.toString();
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 55,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.7, color: appColors.borderColor),
                                ),
                                child: ListTile(
                                    onTap: () {
                                      fareProvider.selectTrainDate(context);
                                    },
                                    contentPadding: EdgeInsets.zero,
                                    visualDensity: const VisualDensity(
                                        horizontal: 0, vertical: -4),
                                    dense: true,
                                    title: Text(
                                      "Calender",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: appColors.textColor,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Inter",
                                      ),
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        appText(
                                            title: fareProvider.date,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: fareProvider.date ==
                                                    "DD-MM-YYYY"
                                                ? appColors.appGray
                                                : appColors.textColor),
                                        Image.asset(
                                          "assets/images/calender.png",
                                          height: 20,
                                          width: 20,
                                        )
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: 180,
                                child: AppButton(
                                  onPressed: () {
                                    validateConnectivity(
                                        context: context,
                                        provider: () async {
                                          if (fareProvider.fromStation ==
                                              null) {
                                            showToast("Select from Stations");
                                          } else if (fareProvider.toStation ==
                                              null) {
                                            showToast("Select to Stations");
                                          } else if (fareProvider.date ==
                                              "DD-MM-YYYY") {
                                            showToast("Select Date first");
                                          } else {
                                            fareProvider
                                                .getFareEnquiry(context);
                                          }
                                        });
                                  },
                                  borderRadius: 13,
                                  title: "Find",
                                  color: appColors.appGreen,
                                  height: 45,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  textColor: appColors.colorBackground,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.13,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/fare.png",
                  height: 70,
                  width: 70,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

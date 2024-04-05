import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../customs/app_button.dart';
import '../../../customs/app_text.dart';
import '../../../customs/customDropdown.dart';
import '../../../customs/navigation.dart';
import '../../../customs/validator.dart';
import '../../../providers/search_train_provider.dart';
import '../../../styles/app_colors.dart';
import '../fareEnquiry/fareDetails.dart';

class SearchTrains extends StatefulWidget {
  SearchTrains({required this.title, required this.image, super.key});
  String title;
  String image;

  @override
  State<SearchTrains> createState() => _SearchTrainsState();
}

class _SearchTrainsState extends State<SearchTrains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.colorBackground,
      body: Consumer<SearchTrainProvider>(
        builder: (context, trainProvider, child) {
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
                top: MediaQuery.of(context).size.height * 0.04,
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
                      title: widget.title,
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
                              CustomDropDown(
                                dropdownHeading: "From",
                                dropDownInitialValue: trainProvider.fromStation,
                                dropDownList: trainProvider.fromStationList,
                                hintText: "Select from station",
                                height: 55,
                                onChange: (val) {
                                  setState(() {
                                    trainProvider.fromStation = val.toString();
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomDropDown(
                                dropdownHeading: "To",
                                dropDownInitialValue: trainProvider.toStation,
                                dropDownList: trainProvider.toStationList,
                                hintText: "Select to station",
                                height: 55,
                                onChange: (val) {
                                  setState(() {
                                    trainProvider.toStation = val.toString();
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 55,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 0.7,
                                            color: appColors.borderColor),
                                      ),
                                      child: ListTile(
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
                                                  title: "14-03-2024",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: appColors.textColor),
                                              Image.asset(
                                                "assets/images/calender.png",
                                                height: 20,
                                                width: 20,
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CustomDropDown(
                                      dropdownHeading: "Class",
                                      dropDownInitialValue:
                                          trainProvider.trainClass,
                                      dropDownList:
                                          trainProvider.trainClassList,
                                      hintText: "Select Class",
                                      height: 55,
                                      onChange: (val) {
                                        setState(() {
                                          trainProvider.trainClass =
                                              val.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: 180,
                                child: AppButton(
                                  onPressed: () {
                                    navigateTo(
                                        context: context,
                                        to: FareDetails(
                                          title: "Train Details",
                                        ));
                                  },
                                  borderRadius: 13,
                                  title: "Get Details",
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
                  widget.image,
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

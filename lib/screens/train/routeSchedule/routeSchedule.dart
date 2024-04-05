import 'package:flutter/material.dart';
import 'package:piponet/customs/navigation.dart';
import 'package:piponet/screens/train/routeSchedule/routeDetails.dart';
import 'package:provider/provider.dart';

import '../../../customs/app_button.dart';
import '../../../customs/app_text.dart';
import '../../../customs/app_text_field.dart';
import '../../../customs/validator.dart';
import '../../../providers/search_train_provider.dart';
import '../../../styles/app_colors.dart';

class RouteSchedule extends StatelessWidget {
  const RouteSchedule({super.key});

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
                      title: "Route / Schedule",
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
                              AppTextField(
                                readOnly: false,
                                fontSize: 16,
                                height: 45,
                                hintText: "ASANSOL - MUMBAI EXP - 12361",
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: appColors.textColor.withOpacity(0.8),
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  color: appColors.textColor.withOpacity(0.8),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: 150,
                                child: AppButton(
                                  onPressed: () {
                                    navigateTo(
                                        context: context,
                                        to: const RouteDetails());
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
                  "assets/images/route.png",
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

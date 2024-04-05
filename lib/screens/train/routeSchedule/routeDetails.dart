import 'package:flutter/material.dart';
import 'package:piponet/providers/route_schedule_provider.dart';
import 'package:provider/provider.dart';

import '../../../customs/app_text.dart';
import '../../../customs/validator.dart';
import '../../../styles/app_colors.dart';
import 'Widgets/routeListData.dart';

class RouteDetails extends StatelessWidget {
  const RouteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RouteScheduleProvider>(
        builder: (context, routeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: appColors.colorBackground,
          title: appText(
              title: "Route Details",
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: appColors.textColor),
        ),
        backgroundColor: appColors.colorBackground,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 0.7, color: appColors.borderColor),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: boxShadow(),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/train1.png",
                            height: 20,
                            width: 18,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText(
                                  title: "ASANSOL - MUMBAI EXP - 12361",
                                  color: appColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 20,
                                  width: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFF1F0),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: appText(
                                    title: "Live Status",
                                    color: appColors.redColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      appText(
                          title: "Available days",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: appColors.textColor),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 35,
                        child: ListView.builder(
                          itemCount: routeProvider.days.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3.0, horizontal: 13),
                                  decoration: BoxDecoration(
                                      color: index == 0
                                          ? appColors.appGreen12
                                          : appColors.borderColor,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: appText(
                                    title: routeProvider.days[index],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: index == 0
                                        ? appColors.colorBackground
                                        : appColors.textColor,
                                  )),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RouteListData()
              ],
            ),
          ),
        ),
      );
    });
  }
}

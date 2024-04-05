import 'package:flutter/material.dart';
import 'package:piponet/customs/app_text.dart';
import 'package:provider/provider.dart';

import '../../../../customs/validator.dart';
import '../../../../providers/fare_enquiry_provider.dart';
import '../../../../styles/app_colors.dart';

class TrainListData extends StatelessWidget {
  const TrainListData({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FareEnquiryProvider>(
        builder: (context, fareProvider, child) {
      return ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(
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
                      children: [
                        Image.asset(
                          "assets/images/train1.png",
                          height: 20,
                          width: 17,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        appText(
                            title: "CBE LTT EXP - 11014",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: appColors.textColor)
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 125,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: fareProvider.ticketList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 0.60,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  fareProvider.ticketList[index]["image"],
                                  height: 63,
                                  width: 63,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                appText(
                                    title: fareProvider.ticketList[index]
                                        ["title"],
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                    fontSize: 12,
                                    color: appColors.textColor)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    appText(
                        title: "Available days",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: appColors.textColor),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        itemCount: fareProvider.days.length,
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
                                    color: appColors.appGreen12,
                                    borderRadius: BorderRadius.circular(6)),
                                child: appText(
                                    title: fareProvider.days[index],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: appColors.colorBackground)),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                                title: "Start",
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: appColors.textColor),
                            appText(
                                title: "SA",
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: appColors.textColor),
                            appText(
                                title: "11:25",
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: appColors.appGray),
                          ],
                        ),
                        Image.asset(
                          "assets/images/train2.png",
                          height: 48,
                          width: 48,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            appText(
                                title: "Destination",
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: appColors.textColor),
                            appText(
                                title: "LLT",
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: appColors.textColor),
                            appText(
                                title: "13:55",
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: appColors.appGray),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    appText(
                        title: "Seat Availability",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: appColors.textColor),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        itemCount: fareProvider.seats.length,
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
                                    color:
                                        index == 1 || index == 2 || index == 6
                                            ? appColors.appGreen12
                                            : appColors.lightBlue,
                                    borderRadius: BorderRadius.circular(6)),
                                child: appText(
                                  title: fareProvider.seats[index],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: index == 1 || index == 2 || index == 6
                                      ? appColors.colorBackground
                                      : appColors.textColor,
                                )),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: appText(
                            title: "1A",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: appText(
                            title: "₹ 3785",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: appText(
                            title: "2A",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: appText(
                            title: "₹ 2175",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: appText(
                            title: "3A",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: appText(
                            title: "₹ 1625",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: appText(
                            title: "SL",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: appText(
                            title: "₹ 575",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: appColors.lightBlue,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          appText(
                            title: "1337km",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          appText(
                            title: "26:30 Hrs",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          appText(
                            title: "50 Km/hr",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    });
  }
}

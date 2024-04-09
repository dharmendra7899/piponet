import 'package:flutter/material.dart';
import 'package:piponet/customs/validator.dart';
import 'package:piponet/providers/home_provider.dart';
import 'package:piponet/screens/train/fareEnquiry/fareEnquiry.dart';
import 'package:provider/provider.dart';

import '../../../../customs/app_text.dart';
import '../../../../customs/navigation.dart';
import '../../../../styles/app_colors.dart';
import '../../../train/liveStatus/liveStatus.dart';
import '../../../train/routeSchedule/routeSchedule.dart';
import '../../../train/searchTrain/searchTrains.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    title: "Ticket Booking & Others",
                    fontSize: 18,
                    color: appColors.textColor,
                    fontWeight: FontWeight.w500),
                Image.asset(
                  "assets/images/arrow.png",
                  height: 20,
                  width: 20,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 285,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.7, color: appColors.borderColor),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: boxShadow(),
                  color: Colors.white),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeProvider.ticketList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.60,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        navigateTo(
                            context: context,
                            to: LiveStatus(
                              image: "assets/images/live.png",
                              hintText: "Train Name/Number",
                              titleName: "Live Status",
                              onPressed: () {},
                            ));
                      } else if (index == 1) {
                        navigateTo(
                            context: context,
                            to: LiveStatus(
                              image: "assets/images/pnr.png",
                              hintText: "PNR Number",
                              titleName: "PNR Status",
                              onPressed: () {},
                            ));
                      } else if (index == 2) {
                        navigateTo(context: context, to: const FareEnquiry());
                      } else if (index == 3) {
                        navigateTo(
                            context: context,
                            to: SearchTrains(
                              title: "Search Trains",
                              image: "assets/images/fare.png",
                            ));
                      } else if (index == 4) {
                        navigateTo(
                            context: context,
                            to: SearchTrains(
                              title: "Seat Availability",
                              image: "assets/images/seat.png",
                            ));
                      } else if (index == 5) {
                        navigateTo(context: context, to: RouteSchedule());
                      }
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          homeProvider.ticketList[index]["image"],
                          height: 63,
                          width: 63,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        appText(
                            title: homeProvider.ticketList[index]["title"],
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                            fontSize: 12,
                            color: appColors.textColor)
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}

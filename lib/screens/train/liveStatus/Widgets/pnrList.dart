import 'package:flutter/material.dart';

import '../../../../customs/app_text.dart';
import '../../../../customs/validator.dart';
import '../../../../styles/app_colors.dart';

class PNRList extends StatefulWidget {
  const PNRList({super.key});

  @override
  State<PNRList> createState() => _PNRListState();
}

class _PNRListState extends State<PNRList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.8, color: appColors.borderColor),
              borderRadius: BorderRadius.circular(20),
              boxShadow: boxShadow(),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: appColors.colorPrimary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/whitePNR.png",
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: appText(
                              title: "IRCTC TEJAS EXP (82902)",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: appColors.colorBackground),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                _textColumn(
                  isSelected: true,
                  title: "11-03-2024",
                  data: 'Chart Prepared',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "From",
                  data: 'BRC (Vadodara Junction)',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "To",
                  data: 'MMCT (MUMBAI CENTRAL)',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  isSelected: true,
                  title: "Seat Status",
                  data: '',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "Booking",
                  data: 'CNF C7 35',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "Current",
                  data: 'CNF C7 35',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "Coach / Platform",
                  data: '-',
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: appColors.lightBlue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/running.png",
                            height: 16,
                            width: 16,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          appText(
                              title: "Running \nStatus",
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/refresh.png",
                            height: 16,
                            width: 16,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          appText(
                              title: "Reload \nRule",
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/route2.png",
                            height: 16,
                            width: 16,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          appText(
                              title: "Route",
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/share.png",
                            height: 16,
                            width: 16,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          appText(
                              title: "share",
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center)
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        });
  }
}

_textColumn(
        {required String title,
        required String data,
        bool isSelected = false}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? appColors.lightGreen : appColors.colorBackground,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: appText(
                title: title,
                color: appColors.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              flex: 3,
              child: appText(
                title: ": $data",
                color: appColors.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );

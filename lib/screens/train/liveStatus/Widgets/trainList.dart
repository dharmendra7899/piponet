import 'package:flutter/material.dart';

import '../../../../customs/app_text.dart';
import '../../../../customs/validator.dart';
import '../../../../styles/app_colors.dart';

class TrainList extends StatefulWidget {
  const TrainList({super.key});

  @override
  State<TrainList> createState() => _TrainListState();
}

class _TrainListState extends State<TrainList> {
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/whiteTrain.png",
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: appText(
                              title: "13119 - Sealdah - Old Delhi Express",
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
                  title: "Journey Station",
                  data: 'Dakhineswar',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "Journey Date",
                  data: '19-May-2023',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "Scheduled Arrival",
                  data: '09:38PM',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "Actual Arrival",
                  data: '05:30AM',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "Scheduled Departure",
                  data: '09:39PM',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "Expected Departure",
                  data: '05:30AM',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "Train Status",
                  data: '-',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "Exp. Platform No.",
                  data: '-',
                ),
                const SizedBox(
                  height: 5,
                ),
                _textColumn(
                  title: "Last Location",
                  data: 'Not Updated',
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

_textColumn({required String title, required String data}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: appText(
              title: title,
              color: appColors.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            child: appText(
              title: ": $data",
              color: appColors.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );

import 'package:flutter/material.dart';
import 'package:piponet/customs/app_text.dart';
import 'package:piponet/screens/train/fareEnquiry/widgets/trainListData.dart';
import 'package:piponet/styles/app_colors.dart';

import '../../../customs/validator.dart';

class FareDetails extends StatelessWidget {
  FareDetails({required this.title, super.key});

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: appColors.colorBackground,
        title: appText(
            title: title,
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
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: appText(
                            title: "From",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: appText(
                            title: ": Salem JN -SA",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: appText(
                            title: "to",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: appText(
                            title: ": Mumbai Central - BCT",
                            color: appColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TrainListData(),
            ],
          ),
        ),
      ),
    );
  }
}

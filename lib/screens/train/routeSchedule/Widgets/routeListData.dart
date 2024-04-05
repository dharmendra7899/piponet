import 'package:flutter/material.dart';
import 'package:piponet/customs/app_text.dart';
import 'package:piponet/styles/app_colors.dart';

import '../../../../customs/validator.dart';

class RouteListData extends StatelessWidget {
  const RouteListData({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.7, color: appColors.borderColor),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: boxShadow(),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        boxShadow: boxShadow(),
                        color: appColors.lightBlue),
                    child: appText(
                        title: "Asansol JN (ASN)",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: appColors.textColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          appText(
                              title: "Arr",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: appColors.colorPrimary),
                          const SizedBox(
                            height: 10,
                          ),
                          appText(
                              title: "Source",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: appColors.textColor)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          appText(
                              title: "Dep",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: appColors.colorPrimary),
                          const SizedBox(
                            height: 10,
                          ),
                          appText(
                              title: "20:10",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: appColors.textColor)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          appText(
                              title: "Avg Delay(Min)",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: appColors.colorPrimary),
                          const SizedBox(
                            height: 10,
                          ),
                          appText(
                              title: "-",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: appColors.textColor)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          appText(
                              title: "Dis(kms)",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: appColors.colorPrimary),
                          const SizedBox(
                            height: 10,
                          ),
                          appText(
                              title: "25.1 KM",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: appColors.textColor)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 14,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: appColors.lightBlue),
                        child: appText(
                            title: "Platform: 3",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: appColors.textColor),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: appColors.lightBlue),
                        child: appText(
                            title: "Day: 1",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: appColors.textColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

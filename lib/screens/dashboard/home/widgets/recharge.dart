import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../customs/app_text.dart';
import '../../../../customs/validator.dart';
import '../../../../providers/home_provider.dart';
import '../../../../styles/app_colors.dart';

class RechargeAndBill extends StatelessWidget {
  const RechargeAndBill({super.key});

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
                    title: "Recharge & Bill Payments",
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
              height: 280,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.7, color: appColors.borderColor),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: boxShadow(),
                  color: Colors.transparent),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeProvider.rechargeList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        homeProvider.rechargeList[index]["image"],
                        height: 63,
                        width: 63,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      appText(
                          title: homeProvider.rechargeList[index]["title"],
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          fontSize: 12,
                          color: appColors.textColor)
                    ],
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

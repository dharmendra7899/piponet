import 'package:flutter/material.dart';

import '../../../../customs/app_text.dart';
import '../../../../customs/validator.dart';
import '../../../../styles/app_colors.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appText(
                  title: "Watch Movies",
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
            // height: 270,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 0.7, color: appColors.borderColor),
                borderRadius: BorderRadius.circular(8),
                boxShadow: boxShadow(),
                color: Colors.transparent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/dummy.png",
                  fit: BoxFit.fill,
                  height: 166,
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(
                  height: 20,
                ),
                appText(
                    title: "Just click and watch",
                    fontSize: 18,
                    color: appColors.textColor,
                    fontWeight: FontWeight.w500),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(
                          "assets/images/dummy1.png",
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

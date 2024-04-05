import 'package:flutter/material.dart';

import '../../customs/app_text.dart';
import '../../styles/app_colors.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.colorBackground,
        centerTitle: false,
        title: appText(
            title: "Notifications",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: appColors.textColor),
      ),
      backgroundColor: appColors.colorBackground,
      body: notificationList(),
    );
  }

  Widget notificationList() {
    return ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Image.asset(
                  "assets/images/notification.png",
                  height: 36,
                  width: 36,
                ),
                title: appText(
                    title:
                        "Get Flat 10% off on recharge using code 'PIPO10' with UPI transaction | Recharge Now!",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: appColors.textColor),
                subtitle: appText(
                    title: "2 hours ago",
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: appColors.appGray),
              ),
              Divider(
                thickness: 1,
                endIndent: 18,
                indent: 18,
                color: appColors.borderColor,
              )
            ],
          );
        });
  }
}

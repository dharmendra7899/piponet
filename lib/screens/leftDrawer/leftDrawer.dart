import 'package:flutter/material.dart';
import 'package:piponet/customs/app_text.dart';
import 'package:piponet/screens/profile/profile.dart';
import 'package:piponet/styles/app_colors.dart';
import 'package:provider/provider.dart';

import '../../customs/navigation.dart';
import '../../providers/auth_provider.dart';
import '../../providers/bottom_navigation_provider.dart';
import '../Notification/notification.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.73,
          color: appColors.colorBackground,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<BottomNavigationProvider>(context,
                              listen: false)
                          .onTapped(2);
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/home.png",
                              height: 18,
                              width: 18,
                              fit: BoxFit.contain,
                              color: appColors.colorPrimary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            appText(
                                title: "Home",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: appColors.textColor),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                          color: appColors.textColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<BottomNavigationProvider>(context,
                              listen: false)
                          .onTapped(0);
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/books.png",
                              height: 18,
                              width: 18,
                              fit: BoxFit.contain,
                              color: appColors.colorPrimary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            appText(
                                title: "Book",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: appColors.textColor),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                          color: appColors.textColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<BottomNavigationProvider>(context,
                              listen: false)
                          .onTapped(1);
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/payments.png",
                              height: 18,
                              width: 18,
                              fit: BoxFit.contain,
                              color: appColors.colorPrimary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            appText(
                                title: "Payments",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: appColors.textColor),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                          color: appColors.textColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<BottomNavigationProvider>(context,
                              listen: false)
                          .onTapped(3);
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/ott.png",
                              height: 18,
                              width: 18,
                              fit: BoxFit.contain,
                              color: appColors.colorPrimary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            appText(
                                title: "OTT",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: appColors.textColor),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                          color: appColors.textColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<BottomNavigationProvider>(context,
                              listen: false)
                          .onTapped(4);
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/wifi.png",
                              height: 18,
                              width: 18,
                              fit: BoxFit.contain,
                              color: appColors.colorPrimary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            appText(
                                title: "Free Wifi",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: appColors.textColor),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                          color: appColors.textColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: appColors.appGray,
                    thickness: 0.5,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () =>
                        navigateTo(context: context, to: const Notifications()),
                    child: appText(
                        title: "Notifications",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: appColors.textColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => navigateTo(context: context, to: Profile()),
                    child: appText(
                        title: "Profile",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: appColors.textColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  appText(
                      title: "Transaction History",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: appColors.textColor),
                  const SizedBox(
                    height: 20,
                  ),
                  appText(
                      title: "Scan",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: appColors.textColor),
                  const SizedBox(
                    height: 20,
                  ),
                  appText(
                      title: "Rate Us",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: appColors.textColor),
                  const SizedBox(
                    height: 20,
                  ),
                  appText(
                      title: "About Us",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: appColors.textColor),
                  const SizedBox(
                    height: 20,
                  ),
                  appText(
                      title: "Terms and Conditions",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: appColors.textColor),
                  const SizedBox(
                    height: 20,
                  ),
                  appText(
                      title: "Privacy Policy",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: appColors.textColor),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  var provider =
                      Provider.of<AuthProvider>(context, listen: false);
                  provider.signOut(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appText(
                        title: "Logout",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: appColors.textColor),
                    Image.asset(
                      "assets/images/logout.png",
                      height: 22,
                      width: 22,
                      fit: BoxFit.contain,
                      color: appColors.colorPrimary,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

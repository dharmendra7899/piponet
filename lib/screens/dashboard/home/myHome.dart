import 'package:flutter/material.dart';
import 'package:piponet/screens/dashboard/home/widgets/movies.dart';
import 'package:piponet/screens/dashboard/home/widgets/recharge.dart';
import 'package:piponet/screens/dashboard/home/widgets/tickets.dart';
import 'package:provider/provider.dart';

import '../../../customs/app_text.dart';
import '../../../customs/customSlider.dart';
import '../../../customs/toast_message.dart';
import '../../../providers/bottom_navigation_provider.dart';
import '../../../styles/app_colors.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      showToast('Double tap to exist.', color: appColors.colorPrimary, time: 2);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: Consumer<BottomNavigationProvider>(
            builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: appColors.colorBackground,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomSlider(
                    deActiveColor: appColors.borderColor,
                    activeColor: appColors.colorPrimary,
                    height: 150,
                    image: "assets/images/banner.png",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Tickets(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Movies(),
                  const SizedBox(
                    height: 20,
                  ),
                  const RechargeAndBill(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: appText(
                        title: "Offers",
                        fontSize: 18,
                        color: appColors.textColor,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomSlider(
                    deActiveColor: appColors.borderColor,
                    activeColor: appColors.colorPrimary,
                    image: "assets/images/offer.png",
                    height: 400,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: appText(
                        title: "Do more with Piponet",
                        fontSize: 18,
                        color: appColors.textColor,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SizedBox(
                      height: 210,
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Image.asset(
                              "assets/images/noDummny.png",
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.16,
                  ),
                ],
              ),
            ),
          );
        }));
  }
}

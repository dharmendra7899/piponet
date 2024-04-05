import 'package:flutter/material.dart';
import 'package:piponet/styles/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../customs/app_text.dart';
import '../../../customs/customSlider.dart';
import '../../../providers/bottom_navigation_provider.dart';
import '../home/widgets/tickets.dart';

class Bookings extends StatefulWidget {
  final bool? isBackButton;
  final String? type;

  const Bookings({super.key, this.isBackButton = true, this.type});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  String? selectedTab;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.isBackButton == true) {
          return true;
        }
        Provider.of<BottomNavigationProvider>(context, listen: false)
            .onTapped(2);
        return false;
      },
      child: Scaffold(
          backgroundColor: appColors.colorBackground,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.20),
                  child: Container(
                    height: MediaQuery.of(context).size.height +
                        MediaQuery.of(context).size.height * 0.26,
                    color: appColors.colorPrimary,
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.06,
                    left: 0,
                    right: 0,
                    child: const Tickets()),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.46,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: appText(
                            title: "Offers",
                            fontSize: 18,
                            color: appColors.colorBackground,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomSlider(
                        deActiveColor: appColors.borderColor,
                        activeColor: appColors.colorBackground,
                        image: "assets/images/dummy123.png",
                        height: MediaQuery.of(context).size.height * 0.45,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: appText(
                            title: "Do more with Piponet",
                            fontSize: 18,
                            color: appColors.colorBackground,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18.0,
                        ),
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
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

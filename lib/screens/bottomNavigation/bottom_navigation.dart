import 'package:flutter/material.dart';
import 'package:piponet/customs/navigation.dart';
import 'package:piponet/screens/dashboard/booking/bookings.dart';
import 'package:piponet/screens/dashboard/freeWIFI/wifi.dart';
import 'package:piponet/screens/dashboard/home/myHome.dart';
import 'package:piponet/screens/dashboard/ott/OTT.dart';
import 'package:piponet/screens/dashboard/payments/payments.dart';
import 'package:piponet/screens/leftDrawer/leftDrawer.dart';
import 'package:piponet/screens/profile/profile.dart';
import 'package:provider/provider.dart';

import '../../customs/validate_connectivity.dart';
import '../../providers/auth_provider.dart';
import '../../providers/bottom_navigation_provider.dart';
import '../../providers/connectivity_provider.dart';
import '../../styles/app_colors.dart';
import '../Notification/notification.dart';
import '../noInternet/no_internet_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      const Bookings(isBackButton: false),
      const Payments(isBackButton: false),
      const MyHome(),
      const OTT(isBackButton: false),
      const FreeWifi(isBackButton: false),
    ];
  }

  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: "homeKey");

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, provider, child) {
        return Consumer<CheckInternet>(
          builder: (context, internet, child) {
            validateConnectivity(
              context: context,
              provider: () {},
              showMessage: false,
            );
            return Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return Scaffold(
                  key: scaffoldKey,
                  drawer: const LeftDrawer(),
                  appBar: AppBar(
                    leading: InkWell(
                      onTap: () => scaffoldKey.currentState!.openDrawer(),
                      child: Image.asset(
                        "assets/images/menu.png",
                        scale: 4,
                      ),
                    ),
                    centerTitle: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          scale: 4,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "assets/images/bharat.png",
                          scale: 4,
                        ),
                      ],
                    ),
                    actions: [
                      InkWell(
                        onTap: () => navigateTo(
                            context: context, to: const Notifications()),
                        child: Image.asset(
                          "assets/images/notification.png",
                          scale: 4,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () =>
                            navigateTo(context: context, to: Profile()),
                        child: Image.asset(
                          "assets/images/account.png",
                          scale: 4,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      provider.onTapped(2);
                    },
                    backgroundColor: appColors.redColor,
                    shape: RoundedRectangleBorder(
                        side:
                            BorderSide(width: 4, color: appColors.borderColor),
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset(
                      height: 25,
                      width: 25,
                      "assets/images/home.png",
                    ),
                  ),
                  extendBody: true,
                  bottomNavigationBar: SafeArea(
                    bottom: true,
                    child: Theme(
                      data: ThemeData(
                        useMaterial3: false,
                      ),
                      child: BottomAppBar(
                        color: Colors.white,
                        elevation: 5,
                        padding: const EdgeInsets.all(3),
                        shape: const CircularNotchedRectangle(),
                        notchMargin: 5.0,
                        child: BottomNavigationBar(
                          showUnselectedLabels: true,
                          showSelectedLabels: true,
                          elevation: 0,
                          type: BottomNavigationBarType.fixed,
                          backgroundColor: Colors.transparent,
                          currentIndex: provider.index,
                          items: _bottomNavigationBarItem(authProvider),
                          selectedItemColor: appColors.colorPrimary,
                          unselectedItemColor: appColors.appGray,
                          selectedLabelStyle: TextStyle(
                            color: appColors.colorPrimary,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            fontFamily: 'Inter',
                          ),
                          unselectedLabelStyle: TextStyle(
                            color: appColors.appGray,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            fontFamily: 'Inter',
                          ),
                          onTap: provider.onTapped,
                          selectedFontSize: 10,
                          unselectedFontSize: 10,
                          iconSize: 22,
                        ),
                      ),
                    ),
                  ),
                  body: internet.isConnected
                      ? screens[provider.index]
                      : const NoInternetPage(),
                );
              },
            );
          },
        );
      },
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItem(
    AuthProvider authProvider,
  ) {
    return [
      BottomNavigationBarItem(
        activeIcon: Image.asset(
          "assets/images/books.png",
          height: 25,
          width: 25,
          fit: BoxFit.contain,
          color: appColors.colorPrimary,
        ),
        icon: Image.asset(
          "assets/images/books.png",
          height: 25,
          width: 25,
          fit: BoxFit.contain,
        ),
        label: 'Book',
      ),
      BottomNavigationBarItem(
        activeIcon: Image.asset(
          "assets/images/payments.png",
          height: 25,
          width: 25,
          color: appColors.colorPrimary,
          fit: BoxFit.contain,
        ),
        icon: Image.asset(
          "assets/images/payments.png",
          height: 25,
          width: 25,
          fit: BoxFit.contain,
        ),
        label: "Payments",
      ),
      const BottomNavigationBarItem(
        activeIcon: SizedBox(),
        icon: SizedBox(),
        label: '',
      ),
      BottomNavigationBarItem(
        activeIcon: Image.asset(
          "assets/images/ott.png",
          height: 25,
          width: 25,
          color: appColors.colorPrimary,
          fit: BoxFit.contain,
        ),
        icon: Image.asset(
          "assets/images/ott.png",
          height: 25,
          width: 25,
          fit: BoxFit.contain,
        ),
        label: 'OTT',
      ),
      BottomNavigationBarItem(
        activeIcon: Image.asset(
          "assets/images/wifi.png",
          height: 25,
          width: 25,
          color: appColors.colorPrimary,
          fit: BoxFit.contain,
        ),
        icon: Image.asset(
          "assets/images/wifi.png",
          height: 25,
          width: 25,
          fit: BoxFit.contain,
        ),
        label: 'Free Wifi',
      ),
    ];
  }
}

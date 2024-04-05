import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../customs/app_text.dart';
import '../../../providers/bottom_navigation_provider.dart';
import '../../../styles/app_colors.dart';

class FreeWifi extends StatefulWidget {
  final bool? isBackButton;
  final String? type;

  const FreeWifi({super.key, this.isBackButton = true, this.type});

  @override
  State<FreeWifi> createState() => _FreeWifiState();
}

class _FreeWifiState extends State<FreeWifi> {
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
        body: Center(
          child: appText(
              title: "Coming Soon!",
              fontSize: 22,
              color: appColors.textColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../customs/app_text.dart';
import '../../../providers/bottom_navigation_provider.dart';
import '../../../styles/app_colors.dart';

class Payments extends StatefulWidget {
  final bool? isBackButton;
  final String? type;

  const Payments({super.key, this.isBackButton = true, this.type});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
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

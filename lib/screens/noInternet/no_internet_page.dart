import 'package:flutter/material.dart';

import '../../customs/app_text.dart';
import '../../styles/app_colors.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            size: 80,
            color: appColors.colorPrimary,
          ),
          const SizedBox(
            height: 10,
          ),
          appText(
            title: 'No internet connection!',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 5,
          ),
          appText(
            title: 'Check your connection',
            fontSize: 16,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w400,
            color: appColors.appGray,
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../customs/navigation.dart';
import '../../providers/auth_provider.dart';
import '../../providers/bottom_navigation_provider.dart';
import '../../styles/app_colors.dart';
import '../auth/login.dart';
import '../bottomNavigation/bottom_navigation.dart';
import '../walkThrough/walk_through.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _navigation();
  }

  _navigation() {
    timer = Timer(const Duration(seconds: 3), () {
      var provider = Provider.of<AuthProvider>(context, listen: false);
      Provider.of<BottomNavigationProvider>(context, listen: false).onTapped(2);
      navigateRemoveUntil(
        context: context,
        to: provider.isUserLoggedIn
            ? const BottomNavigation()
            : provider.isWalkthrough
                ? const WalkThrough()
                : Login(),
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.colorBackground,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          scale: 1.4,
        ),
      ),
    );
  }
}

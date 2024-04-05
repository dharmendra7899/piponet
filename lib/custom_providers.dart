import 'package:flutter/material.dart';
import 'package:piponet/providers/auth_provider.dart';
import 'package:piponet/providers/booking_provider.dart';
import 'package:piponet/providers/bottom_navigation_provider.dart';
import 'package:piponet/providers/connectivity_provider.dart';
import 'package:piponet/providers/details_status_provider.dart';
import 'package:piponet/providers/fare_enquiry_provider.dart';
import 'package:piponet/providers/home_provider.dart';
import 'package:piponet/providers/profile_provider.dart';
import 'package:piponet/providers/route_schedule_provider.dart';
import 'package:piponet/providers/search_train_provider.dart';
import 'package:provider/provider.dart';

class CustomProvider extends StatelessWidget {
  final Widget child;
  final AuthProvider? loginState;

  const CustomProvider({super.key, required this.child, this.loginState});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CheckInternet(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => loginState,
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailsStatusProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FareEnquiryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchTrainProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RouteScheduleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
      ],
      child: child,
    );
  }
}

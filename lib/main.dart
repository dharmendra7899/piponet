import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piponet/firebase_options.dart';
import 'package:piponet/myApp.dart';
import 'package:piponet/providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final state = AuthProvider(await SharedPreferences.getInstance());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // MobileAds.instance.initialize();
  runApp(CustomProvider(
    loginState: state,
    child: const MyApp(),
  ));
}

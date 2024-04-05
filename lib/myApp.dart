import 'package:flutter/material.dart';
import 'package:piponet/screens/Splash/splash_screen.dart';
import 'package:piponet/styles/app_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piponet',
      themeMode: ThemeMode.light,
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      // home: MyHomePage(),
      home: SplashScreen(),
    );
  }
}

// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCk-Es1301588DbLBM89hGM3dW-EWZXMhg',
    appId: '1:306599829309:web:73f8e52ce24e9755556f54',
    messagingSenderId: '306599829309',
    projectId: 'piponet-457bf',
    authDomain: 'piponet-457bf.firebaseapp.com',
    storageBucket: 'piponet-457bf.appspot.com',
    measurementId: 'G-Q2168RWK9S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD16eZ5NUuZ3XGEraEgSMi4NcM-Iqnt2A4',
    appId: '1:306599829309:android:cf36a962dd7148f8556f54',
    messagingSenderId: '306599829309',
    projectId: 'piponet-457bf',
    storageBucket: 'piponet-457bf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDa0adOSxNlWUytfrEgiQ6aL5X8riEaD8g',
    appId: '1:306599829309:ios:072960be02396292556f54',
    messagingSenderId: '306599829309',
    projectId: 'piponet-457bf',
    storageBucket: 'piponet-457bf.appspot.com',
    iosBundleId: 'com.example.piponet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDa0adOSxNlWUytfrEgiQ6aL5X8riEaD8g',
    appId: '1:306599829309:ios:be18768fe20684c9556f54',
    messagingSenderId: '306599829309',
    projectId: 'piponet-457bf',
    storageBucket: 'piponet-457bf.appspot.com',
    iosBundleId: 'com.example.piponet.RunnerTests',
  );
}

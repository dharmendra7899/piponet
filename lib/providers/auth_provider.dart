import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piponet/customs/navigation.dart';
import 'package:piponet/customs/validate_connectivity.dart';
import 'package:piponet/screens/auth/otpVerify.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../customs/toast_message.dart';
import '../screens/auth/login.dart';
import '../screens/bottomNavigation/bottom_navigation.dart';
import 'bottom_navigation_provider.dart';

class AuthProvider extends ChangeNotifier {
  final SharedPreferences _preferences;

  bool _showLoader = false;

  bool get showLoader => _showLoader;

  bool? _token = false;

  bool? get token => _token;

  String? _userID = '';
  String? verificationID;

  String? get userID => _userID;

  UserCredential? userCredential;

  AuthProvider(this._preferences) {
    _token = _preferences.getBool("token") ?? false;
    _userID = _preferences.getString("userID") ?? '';
  }

  _setShowLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  bool get isUserLoggedIn {
    var userDetails = _preferences.getBool("token") ?? false;
    if (userDetails == false) {
      return false;
    } else {
      return true;
    }
  }

  bool get isWalkthrough {
    return _preferences.getBool("walkthrough") ?? true;
  }

  String get getUserId {
    return _preferences.getString("userID") ?? "";
  }

  String get getToken {
    return _preferences.getString("token") ?? "";
  }

  setWalkthrough() {
    _preferences.setBool("walkthrough", false);
  }

  Future<void> sendOTP(
      String phoneNumber, BuildContext context, bool isLoginPage) async {
    validateConnectivity(
        context: context,
        provider: () async {
          _setShowLoader(true);
          FirebaseAuth auth = FirebaseAuth.instance;
          await auth.verifyPhoneNumber(
            phoneNumber: "+91$phoneNumber",
            verificationCompleted: (PhoneAuthCredential credential) async {
              await auth.signInWithCredential(credential);
            },
            verificationFailed: (FirebaseAuthException e) {
              _setShowLoader(false);
              showToast('Verification failed: ${e.message}');
            },
            codeSent: (String verification_Id, int? resendToken) {
              _setShowLoader(false);
              verificationID = verification_Id.toString();
              notifyListeners();
              showToast("OTP sent successfully.", isSuccess: true);
              isLoginPage == true
                  ? navigateTo(
                      context: context, to: OTPVerify(number: phoneNumber))
                  : null;
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              _setShowLoader(false);
              showToast('Verification failed: $verificationId');
            },
            timeout: const Duration(
                seconds: 60), // Timeout duration for OTP auto-retrieval
          );
        });
  }

  Future<void> verifyOTP(
      String verificationId, String otp, BuildContext context) async {
    validateConnectivity(
        context: context,
        provider: () async {
          _setShowLoader(true);
          FirebaseAuth auth = FirebaseAuth.instance;
          try {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationID.toString(),
              smsCode: otp,
            );

            userCredential = await auth.signInWithCredential(credential);

            if (userCredential?.user != null) {
              _setShowLoader(false);
              _preferences.setBool("token", true);
              showToast(
                isSuccess: true,
                "OTP verification successful",
              );
              Provider.of<BottomNavigationProvider>(context, listen: false)
                  .onTapped(2);
              navigateRemoveUntil(
                context: context,
                to: const BottomNavigation(),
              );
            } else {
              _setShowLoader(false);
              _preferences.setBool("token", false);
              showToast("OTP verification failed");
            }
          } catch (e) {
            _preferences.setBool("token", false);
            _setShowLoader(false);
            showToast(
              "OTP verification failed",
            );
          }
        });
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      navigateRemoveUntil(context: context, to: Login());
    } catch (e) {
      showToast('Error signing out. Try again.');
    }
  }
}

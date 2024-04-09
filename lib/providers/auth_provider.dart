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
  String? _phoneNumber = "";

  bool? get token => _token;

  String? get number => _phoneNumber;

  String? _userID = '';
  String? verificationID;

  String? get userID => _userID;

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

  bool get getToken {
    return _preferences.getBool("token") ?? false;
  }

  String get getNumber {
    return _preferences.getString("number") ?? "";
  }

  setWalkthrough() {
    _preferences.setBool("walkthrough", false);
  }

  Future<void> sendOTP(
      String phoneNumber, BuildContext context, bool isLoginPage) async {
    validateConnectivity(
        context: context,
        provider: () async {
          final FirebaseAuth _auth = FirebaseAuth.instance;
          try {
            _setShowLoader(true);

            await _auth.verifyPhoneNumber(
              phoneNumber: "+91$phoneNumber",
              verificationCompleted: (PhoneAuthCredential credential) async {
                _setShowLoader(false);
                await _auth.signInWithCredential(credential);
                print('Verification completed');
                // Handle verification completed
              },
              verificationFailed: (FirebaseAuthException e) {
                _setShowLoader(false);
                showToast('Verification failed: ${e.message}');
                // Handle verification failed
              },
              codeSent: (String verificationId, int? resendToken) {
                _setShowLoader(false);
                verificationID = verificationId;
                showToast("OTP sent successfully.", isSuccess: true);
                if (isLoginPage) {
                  navigateTo(
                      context: context, to: OTPVerify(number: phoneNumber));
                }
              },
              codeAutoRetrievalTimeout: (String verificationId) {
                _setShowLoader(false);
                // showToast('Auto retrieval timeout $verificationId');
                // Handle timeout
              },
            );
          } catch (e) {
            _setShowLoader(false);
            // showToast('Error: $e');
            // Handle other errors
          }
        });
  }

  Future<void> verifyOTP(String otp, BuildContext context) async {
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

            UserCredential? userCredential =
                await auth.signInWithCredential(credential);

            if (userCredential.user != null) {
              _setShowLoader(false);
              _preferences.setBool("token", true);
              _preferences.setString(
                  "number", userCredential.user?.phoneNumber ?? "");
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
      _preferences.setBool("token", false);
      _preferences.setString("number", "");
      notifyListeners();
    } catch (e) {
      showToast('Error signing out. Try again.');
    }
  }
}

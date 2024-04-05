import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:piponet/customs/validator.dart';
import 'package:provider/provider.dart';

import '../../customs/app_button.dart';
import '../../customs/app_text.dart';
import '../../providers/auth_provider.dart';
import '../../styles/app_colors.dart';

class OTPVerify extends StatelessWidget {
  OTPVerify({required this.number, super.key});

  String number;
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.colorBackground,
      body: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              appText(
                  title: "OTP Verification",
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: appColors.textColor),
              const SizedBox(
                height: 4,
              ),
              appText(
                  title: "We have send an OTP on given number +91 $number",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: appColors.appGray),
              const SizedBox(
                height: 40,
              ),
              PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: appColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inter",
                  fontSize: 16,
                ),
                length: 6,
                obscureText: false,
                obscuringCharacter: '*',
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 3) {
                    return "";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  borderWidth: 0.9,
                  activeColor: appColors.borderColor,
                  fieldHeight: 60,
                  fieldWidth: 50,
                  activeBoxShadow: boxShadow(),
                  inActiveBoxShadow: boxShadow(),
                  activeBorderWidth: 0.9,
                  activeFillColor: appColors.colorBackground,
                  selectedBorderWidth: 0.9,
                  disabledBorderWidth: 0.9,
                  inactiveBorderWidth: 0.9,
                  errorBorderWidth: 0.9,
                  inactiveColor: appColors.borderColor,
                  inactiveFillColor: appColors.colorBackground,
                  selectedFillColor: appColors.colorBackground,
                  selectedColor: appColors.borderColor,
                ),
                cursorColor: appColors.textColor,
                animationDuration: const Duration(milliseconds: 300),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  color: appColors.textColor,
                ),
                backgroundColor: Colors.transparent,
                enableActiveFill: false,
                errorAnimationController: errorController,
                controller: otpController,
                keyboardType: TextInputType.number,
                boxShadows: boxShadow(),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  width: 180,
                  child: AppButton(
                      height: 45,
                      borderRadius: 14,
                      onPressed: () {
                        authProvider.verifyOTP("verificationId",
                            otpController.text.toString(), context);
                      },
                      fontSize: 15,
                      isLoading: authProvider.showLoader,
                      fontWeight: FontWeight.w400,
                      title: "Verify"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    await authProvider.sendOTP(number, context, false);
                  },
                  child: appText(
                      title: "Resend OTP",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: appColors.redColor),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

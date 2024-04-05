import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piponet/customs/toast_message.dart';
import 'package:piponet/customs/validate_connectivity.dart';
import 'package:piponet/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../customs/app_button.dart';
import '../../customs/app_text.dart';
import '../../customs/container_text_field.dart';
import '../../styles/app_colors.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController phoneNumber = TextEditingController();

  bool isNumberValid(
    String contactNumber,
  ) {
    final RegExp contactNumberRegExp = RegExp(r'^[0-9]{10}$');
    return contactNumberRegExp.hasMatch(contactNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.colorBackground,
      body: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                      title: "Login",
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: appColors.textColor),
                  const SizedBox(
                    height: 4,
                  ),
                  appText(
                      title: "Enter your mobile number to login",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: appColors.appGray),
                  const SizedBox(
                    height: 40,
                  ),
                  ContainerTextFiled(
                      controller: phoneNumber,
                      isValid: (val) => val.isNotEmpty,
                      headingText: "Mobile Number",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      hintText: "Enter Your Mobile"),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: SizedBox(
                      width: 180,
                      child: AppButton(
                          height: 45,
                          borderRadius: 14,
                          onPressed: () async {
                            validateConnectivity(
                                context: context,
                                provider: () async {
                                  if (phoneNumber.text.isNotEmpty) {
                                    await authProvider.sendOTP(
                                        phoneNumber.text, context, true);
                                  } else {
                                    showToast("Enter Mobile Number first!");
                                  }
                                });
                          },
                          isLoading: authProvider.showLoader,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          title: "Next"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'New user? ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              color: appColors.textColor),
                        ),
                        TextSpan(
                          text: 'Register here',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              color: appColors.redColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

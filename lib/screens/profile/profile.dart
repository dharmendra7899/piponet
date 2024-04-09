import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piponet/providers/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../customs/app_button.dart';
import '../../customs/app_text.dart';
import '../../customs/container_text_field.dart';
import '../../customs/validator.dart';
import '../../providers/auth_provider.dart';
import '../../styles/app_colors.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    preferenceData();
    super.initState();
  }

  preferenceData() async {
    var state = AuthProvider(await SharedPreferences.getInstance());
    phoneController.text = state.getNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.colorBackground,
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: appColors.colorPrimary,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                left: 10,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: appColors.colorBackground,
                      ),
                    ),
                    appText(
                      title: "Profile",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: appColors.colorBackground,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.17,
                left: 0,
                right: 0,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 25),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.8, color: appColors.borderColor),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: boxShadow(),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              ContainerTextFiled(
                                  controller: nameController,
                                  isValid: (val) => val.isNotEmpty,
                                  headingText: "Full Name",
                                  keyboardType: TextInputType.text,
                                  textCapitalization: TextCapitalization.words,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(50),
                                  ],
                                  hintText: "Enter Your Name"),
                              const SizedBox(
                                height: 15,
                              ),
                              ContainerTextFiled(
                                  controller: emailController,
                                  isValid: (val) => val.isNotEmpty,
                                  headingText: "Email Id",
                                  keyboardType: TextInputType.text,
                                  textCapitalization: TextCapitalization.words,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(50),
                                  ],
                                  hintText: "Enter Your Email"),
                              const SizedBox(
                                height: 15,
                              ),
                              ContainerTextFiled(
                                  controller: phoneController,
                                  isValid: (val) => val.isNotEmpty,
                                  headingText: "Mobile Number",
                                  isReadOnly: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  hintText: "Enter Your Mobile"),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: 150,
                                child: AppButton(
                                  onPressed: () {},
                                  borderRadius: 13,
                                  title: "Save",
                                  color: appColors.appGreen,
                                  height: 45,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  textColor: appColors.colorBackground,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.13,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/route.png",
                  height: 70,
                  width: 70,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

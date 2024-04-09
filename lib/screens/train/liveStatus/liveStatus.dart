import 'package:flutter/material.dart';
import 'package:piponet/customs/app_button.dart';
import 'package:piponet/customs/app_text.dart';
import 'package:piponet/customs/app_text_field.dart';
import 'package:piponet/providers/details_status_provider.dart';
import 'package:piponet/styles/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../customs/toast_message.dart';
import '../../../customs/validate_connectivity.dart';
import '../../../customs/validator.dart';
import 'Widgets/pnrList.dart';
import 'Widgets/searchWidget.dart';

class LiveStatus extends StatefulWidget {
  LiveStatus({
    required this.onPressed,
    required this.image,
    required this.titleName,
    required this.hintText,
    this.buttonText = "Search",
    Key? key,
  }) : super(key: key);

  final String titleName;
  final String hintText;
  final String? buttonText;
  final String image;
  final Function onPressed;

  @override
  State<LiveStatus> createState() => _LiveStatusState();
}

class _LiveStatusState extends State<LiveStatus> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: appColors.colorBackground,
        body: Consumer<DetailsStatusProvider>(
          builder: (context, statusProvider, child) {
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
                          statusProvider.isShowStatus = false;
                          statusProvider.isShowPNR = false;
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: appColors.colorBackground,
                        ),
                      ),
                      appText(
                        title: widget.titleName,
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
                    child: statusProvider.isShowStatus == false
                        ? Column(
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
                                    AppTextField(
                                      readOnly: false,
                                      fontSize: 16,
                                      height: 45,
                                      hintText: "Enter ${widget.hintText}",
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: appColors.textColor
                                            .withOpacity(0.8),
                                      ),
                                      controller: textController,
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        color:
                                            appColors.appGray.withOpacity(0.8),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 180,
                                      child: AppButton(
                                        onPressed: () {
                                          validateConnectivity(
                                              context: context,
                                              provider: () async {
                                                if (widget.titleName ==
                                                    "PNR Status") {
                                                  if (textController
                                                      .text.isNotEmpty) {
                                                    statusProvider.getPNRStatus(
                                                        context,
                                                        textController.text
                                                            .toString());
                                                  } else {
                                                    showToast(
                                                        "Enter PNR Number");
                                                  }
                                                } else {
                                                  if (textController
                                                      .text.isNotEmpty) {
                                                    statusProvider
                                                        .getLiveStatus(
                                                            context,
                                                            textController.text
                                                                .toString());
                                                  } else {
                                                    showToast(
                                                        "Enter Train Number/Name");
                                                  }
                                                }
                                              });
                                        },
                                        borderRadius: 13,
                                        isLoading: statusProvider.showLoader,
                                        title: widget.buttonText!,
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
                              widget.titleName == "PNR Status" &&
                                      statusProvider.isShowPNR == true
                                  ? const PNRList()
                                  : const SizedBox()
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SearchWidget(),
                              // TrainList(),
                              for (int index = 0; index < 1; index++)
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.8,
                                        color: appColors.borderColor),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: boxShadow(),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          color: appColors.colorPrimary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/whiteTrain.png",
                                                height: 25,
                                                width: 25,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Expanded(
                                                child: appText(
                                                    title:
                                                        "13119 - Sealdah - Old Delhi Express",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: appColors
                                                        .colorBackground),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      _textColumn(
                                        title: "Journey Station",
                                        data: 'Dakhineswar',
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      _textColumn(
                                        title: "Journey Date",
                                        data: '19-May-2023',
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      _textColumn(
                                        title: "Scheduled Arrival",
                                        data: '09:38PM',
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      _textColumn(
                                        title: "Actual Arrival",
                                        data: '05:30AM',
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      _textColumn(
                                        title: "Scheduled Departure",
                                        data: '09:39PM',
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      _textColumn(
                                        title: "Expected Departure",
                                        data: '05:30AM',
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      _textColumn(
                                        title: "Train Status",
                                        data: '-',
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      _textColumn(
                                        title: "Exp. Platform No.",
                                        data: '-',
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      _textColumn(
                                        title: "Last Location",
                                        data: 'Not Updated',
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                )
                            ],
                          ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.13,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    widget.image,
                    height: 70,
                    width: 70,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

_textColumn({required String title, required String data}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: appText(
              title: title,
              color: appColors.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            child: appText(
              title: ": $data",
              color: appColors.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );

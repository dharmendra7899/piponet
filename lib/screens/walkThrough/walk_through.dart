import 'package:flutter/material.dart';
import 'package:piponet/screens/auth/login.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../customs/app_button.dart';
import '../../customs/app_text.dart';
import '../../customs/navigation.dart';
import '../../providers/auth_provider.dart';
import '../../styles/app_colors.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({super.key});

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  int _currentPage = 0;
  final controller = PageController(keepPage: true);

  List<Map<String, dynamic>> walkthroughData = [
    {
      'image': 'assets/images/dum.png',
      'title': "Pay wherever you \nwant",
    },
    {
      'image': 'assets/images/dum.png',
      'title': "Your payment to \nyour dreams",
    },
    {
      'image': 'assets/images/dum.png',
      'title': "All you need is \nhere",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.colorBackground,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    controller.animateToPage(value,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                    _currentPage = value;
                  });
                },
                allowImplicitScrolling: true,
                pageSnapping: false,
                scrollDirection: Axis.horizontal,
                itemCount: walkthroughData.length,
                physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                itemBuilder: (context, index) => Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          walkthroughData[index]['image'],
                          scale: 3.4,
                        ),
                        Positioned(
                            bottom: MediaQuery.of(context).size.height * 0.20,
                            child: appText(
                              title: walkthroughData[index]['title'],
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: appColors.textColor,
                              textAlign: TextAlign.center,
                            )),
                      ],
                    )),
          ),
          _currentPage == 2
              ? const SizedBox()
              : Positioned(
                  right: 5,
                  top: MediaQuery.of(context).size.height * 0.04,
                  child: SizedBox(
                    width: 100,
                    child: TextButton(
                      onPressed: () {
                        var provider =
                            Provider.of<AuthProvider>(context, listen: false);
                        provider.setWalkthrough();
                        navigateRemoveUntil(context: context, to: Login());
                      },
                      child: appText(
                        title: "Skip",
                        fontSize: 18,
                        color: appColors.appGray,
                      ),
                    ),
                  ),
                ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                _indicator(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, right: 100, left: 100),
                  child: _currentPage == 0 || _currentPage == 1
                      ? AppButton(
                          height: 45,
                          borderRadius: 10,
                          onPressed: () {
                            _jumpToPage();
                          },
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          title: "Next")
                      : AppButton(
                          height: 45,
                          borderRadius: 10,
                          onPressed: () {
                            var provider = Provider.of<AuthProvider>(context,
                                listen: false);
                            provider.setWalkthrough();
                            navigateRemoveUntil(context: context, to: Login());
                          },
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          title: "Get Started"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _jumpToPage() {
    setState(() {
      _currentPage = _currentPage + 1;
      controller.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    });
  }

  Widget _indicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: walkthroughData.length,
      effect: WormEffect(
          dotHeight: 10,
          dotWidth: 16,
          spacing: 8,
          activeDotColor: appColors.colorPrimary,
          dotColor: appColors.borderColor),
    );
  }
}

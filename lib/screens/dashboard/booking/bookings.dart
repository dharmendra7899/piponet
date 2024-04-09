import 'package:flutter/material.dart';
import 'package:piponet/styles/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../customs/app_text.dart';
import '../../../customs/customSlider.dart';
import '../../../providers/bottom_navigation_provider.dart';
import '../home/widgets/tickets.dart';

class Bookings extends StatefulWidget {
  final bool? isBackButton;
  final String? type;

  const Bookings({super.key, this.isBackButton = true, this.type});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  String? selectedTab;
  // BannerAd? bannerAd;
  // bool isLoaded = false;

  @override
  void initState() {
    selectedTab = widget.type;
    super.initState();
  }
/*
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    bannerAd = BannerAd(
        size: AdSize.banner,

        //test id
        // adUnitId: "ca-app-pub-3940256099942544/6300978111",
        //ca-app-pub-5951042120036435/4393143791
        //mine alok
        adUnitId: "ca-app-pub-5951042120036435/4393143791",
        listener: BannerAdListener(
          onAdLoaded: (val) {
            debugPrint("add loaded ");
            setState(() {
              isLoaded = true;
            });
          },
          onAdFailedToLoad: (val, ee) {
            debugPrint("failed to load error");
            debugPrint(ee.toString());
          },
          onAdClosed: (Ad ad) {
            debugPrint("09090090900909090009009090");
            // debugPrint(_controller.value.isPlaying.toString());
            // _controller.play();
          },
          onAdOpened: (Ad ad) {
            debugPrint("add opened 454545445454");
            // _controller.play();
          },
        ),
        request: AdRequest());
    bannerAd!.load();
  }

  final BannerAdListener listener = BannerAdListener(
    onAdLoaded: (Ad ad) => print('Ad loaded.566565656565656565'),
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      ad.dispose();
      print('Ad failed to load2222222222222222222222222222: $error');
    },
    onAdOpened: (Ad ad) => print('Ad opened.1111111111111111111'),
    onAdClosed: (Ad ad) => print('Ad closed.w2213343871234565342  123'),
    onAdImpression: (Ad ad) => print('Ad impression.122333444444444444444'),
  );*/

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.isBackButton == true) {
          return true;
        }
        Provider.of<BottomNavigationProvider>(context, listen: false)
            .onTapped(2);
        return false;
      },
      child: Scaffold(
          backgroundColor: appColors.colorBackground,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.20),
                  child: Container(
                    height: MediaQuery.of(context).size.height +
                        MediaQuery.of(context).size.height * 0.26,
                    color: appColors.colorPrimary,
                  ),
                ),
                // Positioned(
                //   top: 0,
                //   right: 0,
                //   left: 0,
                //   child: Container(
                //     color: Colors.red,
                //     height: 40,
                //     child: AdWidget(
                //       ad: bannerAd!,
                //     ),
                //   ),
                // ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.06,
                    left: 0,
                    right: 0,
                    child: const Tickets()),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.46,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: appText(
                            title: "Offers",
                            fontSize: 18,
                            color: appColors.colorBackground,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomSlider(
                        deActiveColor: appColors.borderColor,
                        activeColor: appColors.colorBackground,
                        image: "assets/images/dummy123.png",
                        height: MediaQuery.of(context).size.height * 0.45,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: appText(
                            title: "Do more with Piponet",
                            fontSize: 18,
                            color: appColors.colorBackground,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18.0,
                        ),
                        child: SizedBox(
                          height: 210,
                          child: ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  "assets/images/noDummny.png",
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

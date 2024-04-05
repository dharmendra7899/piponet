import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  CustomSlider(
      {super.key,
      required this.height,
      required this.image,
      required this.activeColor,
      required this.deActiveColor});

  double height;
  String image;
  Color activeColor = const Color(0xff283595);
  Color deActiveColor = const Color(0xffE6E6E6);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  PageController controller = PageController();
  int currentIndexOfPage = 0;

  void changePageIndex({required int index}) {
    currentIndexOfPage = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
              controller: controller,
              onPageChanged: (value) => changePageIndex(index: value),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.transparent),
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.fill,
                    ),
                  )),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 10,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics:
                  const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                height: 5,
                width: currentIndexOfPage == index ? 20 : 10,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: currentIndexOfPage == index
                      ? widget.activeColor
                      : widget.deActiveColor,
                  borderRadius: BorderRadius.circular(
                      currentIndexOfPage == index ? 30 : 5),
                ),
              ),
            ))
      ],
    );
  }
}

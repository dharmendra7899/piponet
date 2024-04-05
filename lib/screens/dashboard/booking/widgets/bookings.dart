import 'package:flutter/material.dart';
import 'package:piponet/customs/validator.dart';
import 'package:piponet/providers/booking_provider.dart';
import 'package:provider/provider.dart';

import '../../../../customs/app_text.dart';
import '../../../../styles/app_colors.dart';

class bookingWidget extends StatelessWidget {
  const bookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child:
          Consumer<BookingProvider>(builder: (context, bookingProvider, child) {
        return Container(
          height: 285,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 0.7, color: appColors.borderColor),
              borderRadius: BorderRadius.circular(8),
              boxShadow: boxShadow(),
              color: Colors.white),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bookingProvider.ticketList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.60,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    bookingProvider.ticketList[index]["image"],
                    height: 63,
                    width: 63,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  appText(
                      title: bookingProvider.ticketList[index]["title"],
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      fontSize: 12,
                      color: appColors.textColor)
                ],
              );
            },
          ),
        );
      }),
    );
  }
}

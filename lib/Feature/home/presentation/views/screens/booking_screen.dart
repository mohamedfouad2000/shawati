import 'package:flutter/material.dart';

import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/screens/booking_details.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/custom_appbar_booking.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_iteam_widget.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16, top: 32, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBookingAppBar(),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Upcoming booking",
              style: StylesData.font18,
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const ProductItem(),
                Positioned(
                  right: 9,
                  bottom: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          NavegatorPush(context, const BookingDetailsScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, bottom: 10),
                          child: Icon(Icons.double_arrow_outlined,
                              size: 18, color: ConstColor.kMainColor),
                        ),
                      ),
                      Text(
                        "15 jun, 11:00 am",
                        style: StylesData.font12,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Rental history",
              style: StylesData.font18,
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const ProductItem(),
                Positioned(
                  right: 9,
                  bottom: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          NavegatorPush(context, const BookingDetailsScreen());
                        },
                        child: Icon(Icons.double_arrow_outlined,
                            size: 18, color: ConstColor.kMainColor),
                      ),
                      Text(
                        "15 jun, 11:00 am",
                        style: StylesData.font12,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/booking_payment_method.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/clock_in_out_with_time.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookingProduct extends StatelessWidget {
  const BookingProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage(AssetsData.testimage2), fit: BoxFit.cover)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "The family villa",
          style: StylesData.font24Google,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Jeddah, Saudi Arabia",
              style: StylesData.font12.copyWith(color: Colors.black),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 150,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade300)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageIcon(
                AssetImage(
                  AssetsData.image3,
                ),
                color: Colors.grey,
                size: 14,
              ),
              Text(
                " 5",
                style: StylesData.font14,
              ),
              const SizedBox(
                width: 15,
              ),
              const ImageIcon(
                AssetImage(
                  AssetsData.image2,
                ),
                color: Colors.grey,
                size: 14,
              ),
              Text(
                " 3",
                style: StylesData.font14,
              ),
              const SizedBox(
                width: 15,
              ),
              const ImageIcon(
                AssetImage(
                  AssetsData.image1,
                ),
                color: Colors.grey,
                size: 14,
              ),
              Text(
                " 2",
                style: StylesData.font14,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const ClockInOutWithTime(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

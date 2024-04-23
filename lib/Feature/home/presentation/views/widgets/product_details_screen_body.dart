import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';

import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/screens/schedule_screen.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/google_map.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/owner_product.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_image.dart';
// import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductImage(),
            const SizedBox(
              height: 10,
            ),
            Text(
              "About Appartment",
              style: StylesData.font24Google.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "A paired home is two homes that share a wall and have opposite side entries. The whole building is designed to look like one single larger home. Unlike a front to front duplex, the paired home helps provide more privacy for the homeowners.",
              style: StylesData.font11.copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Lesting Agent",
              style: StylesData.font24Google.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            const OwnerProduct(),
            const SizedBox(
              height: 8,
            ),
            const CalendarDetails(),
            const SizedBox(
              height: 8,
            ),
            const GoogleMapWidget(),
            const SizedBox(
              height: 10,
            ),
            defaultButton(
                fun: () {
                  NavegatorPush(context, const ScheduleScreen());
                },
                textWidget: Text(
                  'Apply filters',
                  style: StylesData.font13,
                ),
                height: 54,
                c: ConstColor.kMainColor),
          ],
        ),
      ),
    );
  }
}

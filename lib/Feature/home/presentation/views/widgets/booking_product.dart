import 'package:flutter/material.dart';
import 'package:shawati/Core/constans/const.dart';

import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/clock_in_out_with_time.dart';
import 'package:shawati/generated/l10n.dart';

class BookingProduct extends StatelessWidget {
  const BookingProduct(
      {super.key,
      required this.name,
      required this.place,
      required this.bed,
      required this.bath,
      required this.floor,
      required this.clockin,
      required this.clockout,
      required this.image,
      required this.price});
  final String name;
  final String image;

  final String place;
  final String bed;
  final String bath;
  final String floor;
  final String clockin;
  final String clockout;
  final String price;

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
            // image: const DecorationImage(
            //     image: AssetImage(AssetsData.testimage2), fit: BoxFit.cover)
          ),
          child: CachedImage('$xURLIMAGE$image'),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
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
              place,
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
                " $bed",
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
                " $bath",
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
                " $floor",
                style: StylesData.font14,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ClockInOutWithTime(
          clockin: clockin,
          clockout: clockout,
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "${S.of(context).SAR} $price ",
              style: StylesData.font18.copyWith(color: ConstColor.kMainColor),
            ),
            Expanded(
              child: Text(
                "/${S.of(context).day}",
                style: StylesData.font16
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

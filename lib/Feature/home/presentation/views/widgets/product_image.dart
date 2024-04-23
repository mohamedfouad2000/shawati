import 'package:flutter/material.dart';

import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

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
        Row(
          children: [
            Expanded(
              child: Text(
                "The family villa",
                style: StylesData.font24Google,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Color(0xffFFA800)),
                  Text(
                    '4.89',
                    style: StylesData.font17
                        .copyWith(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
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
          height: 10,
        ),
        Row(
          children: [
            Text(
              "SAR 150 ",
              style: StylesData.font18.copyWith(color: ConstColor.kMainColor),
            ),
            Expanded(
              child: Text(
                "/Day",
                style: StylesData.font16
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                  color: const Color(0xff2369FC).withOpacity(.1),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Row(
                children: [
                  Text(
                    'For You',
                    style: StylesData.font8
                        .copyWith(fontSize: 8, color: ConstColor.kMainColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

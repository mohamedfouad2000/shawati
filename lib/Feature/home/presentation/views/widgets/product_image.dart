import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:shawati/Core/constans/const.dart';

import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/screens/view_image_screen.dart';
import 'package:shawati/generated/l10n.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ProductImage extends StatelessWidget {
  const ProductImage(
      {super.key,
      required this.name,
      required this.place,
      required this.rate,
      required this.bed,
      required this.bath,
      required this.floor,
      required this.price,
      required this.image,
      required this.nameAr});
  final String name;
  final String nameAr;

  final String image;

  final String place;
  final int rate;
  final int bed;
  final int bath;
  final int floor;
  final int price;

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
            ),
            child: InkWell(
                onTap: () {
                  NavegatorPush(
                      context,
                      ProductImageScreen(imageList: [
                        '$xURLIMAGE$image',
                      ]));
                },
                child: CachedImage('$xURLIMAGE$image'))),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                LocalizationCubit.get(context).isArabic() ? nameAr : name,
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
                    rate.toString(),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                  color: const Color(0xff2369FC).withOpacity(.1),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Row(
                children: [
                  Text(
                    S.of(context).ForYou,
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

import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:shawati/Core/constans/const.dart';

import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/home_model/gallery.dart';
import 'package:shawati/Feature/home/data/model/search_model/feature.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/screens/view_image_screen.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/clock_in_out_with_time.dart';
import 'package:shawati/generated/l10n.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ProductImage extends StatefulWidget {
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
      required this.nameAr,
      required this.images,
      required this.features,
      required this.placear,
      required this.clockin,
      required this.clockout});
  final String name;
  final String nameAr;

  final String image;

  final String place;
  final String placear;
  final String clockin;
  final String clockout;

  final dynamic rate;
  final int bed;
  final int bath;
  final int floor;
  final int price;
  final List<Gallery> images;
  final List<Feature> features;

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  String currentImage = '';
  int indexImage = 0;
  Set<String> i = {};
  List<String> images = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var element in widget.features) {
      print("aha ya man ${element.image}");
    }
    currentImage = '$xURLIMAGE${widget.image}';
    images = List.generate(widget.images.length, (index) {
      // Set<String>images = Set.from(widget.images.map((e) => e.path!));
      // images.add('$xURLIMAGE${widget.image}');
      return '$xURLIMAGE${widget.images[index].path}';
    });
    images.add('$xURLIMAGE${widget.image}');
    i = images.toSet();
  }

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
                      ProductImageScreen(
                        imageList: images.toSet().toList(),
                        index: indexImage,
                      ));
                },
                child: CachedImage(currentImage))),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 80,
          // width: 60,
          child: ListView.separated(
            itemCount: images.toSet().toList().length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    currentImage = i.toList()[index] ??
                        '$xURLIMAGE${widget.images.first.path!}';
                    indexImage = index;
                  });
                },
                child: CachedImage(
                  width: 60,
                  i.toList()[index],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                LocalizationCubit.get(context).isArabic()
                    ? widget.nameAr
                    : widget.name,
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
                    widget.rate.toString(),
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
              LocalizationCubit.get(context).isArabic()
                  ? widget.placear
                  : widget.place,
              style: StylesData.font12.copyWith(color: Colors.black),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          // width: 150,
          height: 40,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade300)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
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
                  " ${widget.bed}",
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
                  " ${widget.bath}",
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
                  " ${widget.floor}",
                  style: StylesData.font14,
                ),
                const SizedBox(
                  width: 15,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          ImageIcon(
                            NetworkImage(
                                '$xURLIMAGE${widget.features[index].image}'),
                            color: Colors.grey,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            LocalizationCubit.get(context).isArabic()
                                ? " ${widget.features[index].featureNameAr}"
                                : " ${widget.features[index].featureName}",
                            style: StylesData.font14,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                    itemCount: widget.features.length ?? 0)
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ClockInOutWithTime(
          clockin: widget.clockin,
          clockout: widget.clockout,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              "${S.of(context).SAR} ${widget.price} ",
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

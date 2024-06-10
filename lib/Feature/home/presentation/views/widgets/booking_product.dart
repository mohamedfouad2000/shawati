import 'package:flutter/material.dart';
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
import 'package:shawati/Feature/home/presentation/views/widgets/test_calender.dart';
import 'package:shawati/generated/l10n.dart';

class BookingProduct extends StatefulWidget {
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
      required this.price,
      required this.images,
      required this.features,
      required this.namear,
      required this.placear,
      required this.paymentStatusId});
  final String name;
  final String namear;
  final String image;
  final String place;
  final String placear;
  final String bed;
  final String bath;
  final String floor;
  final String clockin;
  final String clockout;
  final String price;
  final List<Gallery> images;
  final List<Feature> features;
  final int paymentStatusId;

  @override
  State<BookingProduct> createState() => _BookingProductState();
}

class _BookingProductState extends State<BookingProduct> {
  String currentImage = '';

  Set<String> i = {};
  List<String> images = [];
  int indexImage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
    Map<int, String> paymentStatus = {
      1: S.of(context).unpaid,
      2: S.of(context).pending,
      3: S.of(context).paid,
    };
    Map<int, Color> paymentStatusColor = {
      1: Colors.red,
      2: ConstColor.kMainColor,
      3: Colors.green,
    };
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
                    ),
                  );
                },
                child: CachedImage(currentImage))),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 80,
          // width: 60,
          child: ListView.separated(
            itemCount: i.toList().length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    print("ahaa");
                    currentImage = i.toList()[index] ??
                        '$xURLIMAGE${widget.images.first.path!}';
                    indexImage = index;
                  });
                  print(currentImage);
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
                    ? widget.namear
                    : widget.name,
                style: StylesData.font24Google,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: paymentStatusColor[widget.paymentStatusId] ??
                          ConstColor.kMainColor),
                  color: paymentStatusColor[widget.paymentStatusId] ??
                      ConstColor.kMainColor),
              child: Text(
                paymentStatus[widget.paymentStatusId] ?? '',
                style: StylesData.font12.copyWith(color: Colors.white),
              ),
            )
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
        // Container(
        //   // width: 150,
        //   height: 40,
        //   padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(25),
        //       border: Border.all(color: Colors.grey.shade300)),
        //   child: SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         const ImageIcon(
        //           AssetImage(
        //             AssetsData.image3,
        //           ),
        //           color: Colors.grey,
        //           size: 14,
        //         ),
        //         Text(
        //           " ${widget.bed}",
        //           style: StylesData.font14,
        //         ),
        //         const SizedBox(
        //           width: 15,
        //         ),
        //         const ImageIcon(
        //           AssetImage(
        //             AssetsData.image2,
        //           ),
        //           color: Colors.grey,
        //           size: 14,
        //         ),
        //         Text(
        //           " ${widget.bath}",
        //           style: StylesData.font14,
        //         ),
        //         const SizedBox(
        //           width: 15,
        //         ),
        //         const ImageIcon(
        //           AssetImage(
        //             AssetsData.image1,
        //           ),
        //           color: Colors.grey,
        //           size: 14,
        //         ),
        //         Text(
        //           " ${widget.floor}",
        //           style: StylesData.font14,
        //         ),
        //         const SizedBox(
        //           width: 15,
        //         ),
        //         ListView.separated(
        //             shrinkWrap: true,
        //             scrollDirection: Axis.horizontal,
        //             physics: const NeverScrollableScrollPhysics(),
        //             itemBuilder: (context, index) {
        //               return Row(
        //                 children: [
        //                   CachedImage(
        //                       '$xURLIMAGE${widget.features[index].image}',
        //                       height: 14,
        //                       width: 14),
        //                   // ImageIcon(
        //                   //   NetworkImage(
        //                   //       ),
        //                   //   color: Colors.grey,
        //                   //   size: 14,
        //                   // ),
        //                   const SizedBox(
        //                     width: 3,
        //                   ),
        //                   Text(
        //                     " ${widget.features[index].featureName}",
        //                     style: StylesData.font14,
        //                   ),
        //                 ],
        //               );
        //             },
        //             separatorBuilder: (context, index) {
        //               return const SizedBox(
        //                 width: 15,
        //               );
        //             },
        //             itemCount: widget.features.length ?? 0)
        //       ],
        //     ),
        //   ),
        // ),

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
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              LocalizationCubit.get(context).isArabic()
                  ? "${widget.price} ${S.of(context).SAR} "
                  : "${S.of(context).SAR} ${widget.price}",
              style: StylesData.font18.copyWith(color: ConstColor.kMainColor),
            ),
            Expanded(
              child: Text(
                "/ ${S.of(context).day}",
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

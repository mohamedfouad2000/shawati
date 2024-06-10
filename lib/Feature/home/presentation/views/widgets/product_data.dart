import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/home_model/gallery.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Add%20Or%20Remove%20Fav/add_or_remove_fav_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductData extends StatefulWidget {
  const ProductData({
    super.key,
    required this.title,
    required this.gallary,
    required this.titlearab,
    required this.subTitle,
    required this.subTitlearab,
    required this.image,
    required this.money,
    required this.id,
    this.frombooking,
    this.bookingstatus,
    this.paymentStatusId,
  });
  final String title;
  final int id;
  final String subTitle;
  final String image;
  final String money;
  final String titlearab;
  final String subTitlearab;
  final bool? frombooking;
  final int? bookingstatus;
  final int? paymentStatusId;

  final List<Gallery>? gallary;

  @override
  State<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
  PageController pageController = PageController();
  List<String> images = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images.add('$xURLIMAGE${widget.image}');

    widget.gallary?.forEach((element) {
      images.add('$xURLIMAGE${element.path}');
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<int, String> bookingStatus = {
      1: S.of(context).pending,
      // 2: S.of(context).inprogress,
      3: S.of(context).Approved,
      4: S.of(context).Rejected,
    };
    Map<int, String> paymentStatus = {
      1: S.of(context).unpaid,
      2: S.of(context).pending,
      3: S.of(context).paid,
    };
    return BlocConsumer<AddOrRemoveFavCubit, AddOrRemoveFavState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: widget.frombooking != null
                    ? Alignment.topLeft
                    : Alignment.bottomRight,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // image: DecorationImage(
                      //     image: NetworkImage('$xURLIMAGE$image'),
                      //     fit: BoxFit.cover)
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        PageView(
                          physics: const BouncingScrollPhysics(),
                          controller: pageController,
                          onPageChanged: (value) => {},
                          children: [
                            ...images
                                .toSet()
                                .toList()
                                .map((e) => CachedImage(e)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: images.toSet().toList().length ?? 0,
                            effect: ExpandingDotsEffect(
                              dotHeight: 5,
                              dotWidth: 5,
                              dotColor: const Color(0xFFD7D7D7),
                              activeDotColor: ConstColor.kMainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.frombooking != null)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ConstColor.kMainColor,
                          ),
                          child: Text(
                            bookingStatus[widget.bookingstatus] ?? '',
                            style:
                                StylesData.font12.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  if (widget.frombooking == null)
                    (AddOrRemoveFavCubit.get(context)
                                .favouritesList[widget.id]! ==
                            true
                        ? Positioned(
                            right: 18,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.white,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: ConstColor.kMainColor,
                                  child: const Center(
                                    child: Image(
                                        image: AssetImage(
                                          AssetsData.save,
                                        ),
                                        width: 15,
                                        height: 15),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox())
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      LocalizationCubit.get(context).isArabic()
                          ? widget.titlearab
                          : widget.title,
                      style: StylesData.font24Google,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  if (widget.frombooking != null)
                    Text(
                      '${S.of(context).Payment}: ${paymentStatus[widget.paymentStatusId]}',
                      style: StylesData.font16raleway
                          .copyWith(color: ConstColor.kMainColor),
                    )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    LocalizationCubit.get(context).isArabic()
                        ? widget.subTitlearab
                        : widget.subTitle,
                    style: StylesData.font12.copyWith(color: Colors.black),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    LocalizationCubit.get(context).isArabic()
                        ? " ${widget.money} ${S.of(context).SAR}  "
                        : "${S.of(context).SAR} ${widget.money} ",
                    style: StylesData.font18
                        .copyWith(color: ConstColor.kMainColor),
                  ),
                  Text(
                    '/ ${S.of(context).day}',
                    style: StylesData.font16.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Add%20Or%20Remove%20Fav/add_or_remove_fav_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/screens/product_details_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/view_image_screen.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_details_screen_body.dart';
import 'package:shawati/generated/l10n.dart';

class ProductData extends StatelessWidget {
  const ProductData({
    super.key,
    required this.title,
    required this.titlearab,
    required this.subTitle,
    required this.subTitlearab,
    required this.image,
    required this.money,
    required this.id,
  });
  final String title;
  final int id;
  final String subTitle;
  final String image;
  final String money;
  final String titlearab;
  final String subTitlearab;

  @override
  Widget build(BuildContext context) {
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
                alignment: Alignment.bottomRight,
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
                    child: CachedImage('$xURLIMAGE$image'),
                  ),
                  if (AddOrRemoveFavCubit.get(context).favouritesList[id]! ==
                      true)
                    Positioned(
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
                          ? titlearab
                          : title,
                      style: StylesData.font24Google,
                    ),
                  ),
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
                        ? subTitlearab
                        : subTitle,
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
                    "${S.of(context).SAR} $money ",
                    style: StylesData.font18
                        .copyWith(color: ConstColor.kMainColor),
                  ),
                  Text(
                    S.of(context).day,
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

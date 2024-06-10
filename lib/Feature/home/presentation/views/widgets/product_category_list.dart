import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Core/widgets/empty_wid.dart';
import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Add%20Or%20Remove%20Fav/add_or_remove_fav_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/screens/product_details_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/product_details_screen_home.dart';
import 'package:shawati/generated/l10n.dart';

class ProductCategoryList extends StatelessWidget {
  const ProductCategoryList({
    super.key,
    required this.catId,
  });
  final int catId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is HomeSucc) {
          if (state.model.data!.services!.isEmpty) {
            return const Center(child: EmptyWidget());
          }
          return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
              childAspectRatio: .7,
              children: [
                ...List.generate(
                    state.model.data?.services?.length ?? 0,
                    (index) => item(
                          owner: state.model.data!.contactDetails!,
                          context,
                          model: state.model.data!.services![index],
                        ))
              ]);
        } else if (state is HomeError) {
          return Center(child: Text(state.msg));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

Widget item(context,
        {required Service? model, required ContactDetails owner}) =>
    InkWell(
      onTap: () {
        NavegatorPush(
            context,
            ProductDetailsScreen(
              model: model!,
              owner: owner,
            ));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<AddOrRemoveFavCubit, AddOrRemoveFavState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.bottomRight,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CachedImage('$xURLIMAGE${model?.image}'),
                    ),
                    if (BlocProvider.of<AddOrRemoveFavCubit>(context)
                            .favouritesList[model?.id] ==
                        true)
                      Positioned(
                        right: 8,
                        bottom: -20,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                            ),
                            CircleAvatar(
                              radius: 16,
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
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    LocalizationCubit.get(context).isArabic()
                        ? '${model?.nameAr}'
                        : '${model?.name}',
                    maxLines: 2,
                    style: StylesData.font13.copyWith(color: Colors.black),
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
                  size: 12,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${model?.place}',
                  style: StylesData.font12
                      .copyWith(color: Colors.black, fontSize: 6),
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
                  "${S.of(context).SAR} ${model?.regularPrice} ",
                  style: StylesData.font8.copyWith(
                    color: ConstColor.kMainColor,
                  ),
                ),
                Text(
                  "/${S.of(context).day}",
                  style: StylesData.font7.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );

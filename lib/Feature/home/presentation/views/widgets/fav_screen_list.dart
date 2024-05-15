import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Core/widgets/empty_wid.dart';
import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Add%20Or%20Remove%20Fav/add_or_remove_fav_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Fav%20Cubit/fav_cubit.dart';

import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/screens/product_deatils_screen_Fav.dart';
import 'package:shawati/Feature/home/presentation/views/screens/product_details_screen.dart';
import 'package:shawati/generated/l10n.dart';

class FavScreenList extends StatelessWidget {
  const FavScreenList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) =>
            FavCubit(HomeRepoImpl())..getFavList(context: context),
        child: BlocConsumer<FavCubit, FavState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is FavSuccess) {
              if (state.model.data!.favorites == null) {
                return const Expanded(child: Center(child: EmptyWidget()));
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
                        state.model.data?.favorites?.length ?? 0,
                        (index) => item(
                              owner: state.model.data!.contactDetails!,
                              context,
                              model:
                                  state.model.data!.favorites![index].service,
                            ))
                  ]);
            } else if (state is FavFailed) {
              return Center(child: Text(state.message));
            } else {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget item(context,
        {required Service? model, required ContactDetails owner}) =>
    InkWell(
      onTap: () {
        NavegatorPush(
            context,
            ProductDetailsScreenFav(
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
                            .favoritesListFav[model?.id] ==
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
                Text(
                  LocalizationCubit.get(context).isArabic()
                      ? '${model?.nameAr}'
                      : '${model?.name}',
                  style: StylesData.font13.copyWith(color: Colors.black),
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
                  "${S.of(context).SAR} ${model?.priceWithCommission} ",
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

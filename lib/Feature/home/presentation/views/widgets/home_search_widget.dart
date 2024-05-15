import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';

import 'package:shawati/Feature/home/presentation/views/screens/filter_screen.dart';
import 'package:shawati/generated/l10n.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
    required this.searchController,
    this.cateId,
  });

  final TextEditingController searchController;
  final int? cateId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: InkWell(
                // onTap: () {
                //   Nav(context, const HomeView(currentidex: 1));
                // },
                child: customTextFiled(
                    controller: searchController,
                    // enabled: false,
                    onChanged: (i) {
                      BlocProvider.of<HomeCubit>(context).getHomeData(
                          cateId: cateId != null ? cateId! : -1,
                          text: i,
                          context: context);
                      // BlocProvider.of<SearchCubit>(context).searchData(
                      //     text: i,
                      //     categoryId: '',
                      //     minPrice: '',
                      //     maxPrice: '',
                      //     bed: '',
                      //     floor: '',
                      //     bath: '',
                      //     priceDuration: '',
                      //     area: '');
                    },
                    hintText: S.of(context).search,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: ImageIcon(
                        AssetImage(
                          AssetsData.searchicon,
                        ),
                        size: 6,
                        color: Colors.grey,
                      ),
                    )),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () async {
                LocationData location = LocationData.fromMap({});
                NavegatorPush(context, FilterScreen(location: location));
                // NavegatorPush(context, FilterScreen(location: location));
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: ConstColor.kMainColor,
                    border: Border.all(
                      color: ConstColor.kMainColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(13),
                    )),
                child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.filter_list_rounded,
                      color: Colors.white,
                      size: 22,
                    )),
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawati/Feature/home/presentation/views/screens/filter_screen.dart';

import 'package:shawati/Feature/home/presentation/views/widgets/price_duration.dart';
import 'package:shawati/generated/l10n.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: customTextFiled(
                  controller: searchController,
                  onChanged: (i) {
                    SearchCubit.get(context).text = i;
                    SearchCubit.get(context).searchData(
                      context: context,
                        lat: SearchCubit.get(context).lat ?? 0.0,
                        long: SearchCubit.get(context).long ?? 0.0,
                        text: i,
                        categoryId: SearchCubit.get(context).categoryId != -1 &&
                                SearchCubit.get(context).categoryId != null
                            ? SearchCubit.get(context).categoryId.toString() ??
                                ''
                            : '',
                        minPrice: SearchCubit.get(context).minPrice != -1 &&
                                SearchCubit.get(context).minPrice != null
                            ? SearchCubit.get(context).minPrice.toString() ?? ''
                            : '',
                        maxPrice: SearchCubit.get(context).maxPrice != -1 &&
                                SearchCubit.get(context).maxPrice != null
                            ? SearchCubit.get(context).maxPrice.toString() ?? ''
                            : '',
                        bed: SearchCubit.get(context).bed != -1 && SearchCubit.get(context).bed != null
                            ? (SearchCubit.get(context).bed! + 1).toString() ??
                                ''
                            : '',
                        floor: SearchCubit.get(context).floor != -1 &&
                                SearchCubit.get(context).floor != null
                            ? (SearchCubit.get(context).floor! + 1).toString() ?? ''
                            : '',
                        bath: SearchCubit.get(context).bath != -1 && SearchCubit.get(context).bath != null ? (SearchCubit.get(context).bath! + 1).toString() ?? '' : '',
                        priceDuration: SearchCubit.get(context).priceDuration != -1 && SearchCubit.get(context).priceDuration != null ? titles[SearchCubit.get(context).priceDuration!] ?? '' : '',
                        maxarea: SearchCubit.get(context).maxarea != -1 && SearchCubit.get(context).maxarea != null ? SearchCubit.get(context).maxarea.toString() ?? '' : '',
                        minarea: SearchCubit.get(context).minarea != -1 && SearchCubit.get(context).minarea != null ? SearchCubit.get(context).minarea.toString() ?? '' : '');
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
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () async {
                LocationData location = LocationData.fromMap({});
                // print(location.latitude);
                NavegatorPush(context, FilterScreen(location: location));
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

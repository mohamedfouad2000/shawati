import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/area_filter.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/bath_room.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/bed_room.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/floor.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/price_duration.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/price_filter.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/type_filter.dart';

// import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterScreenBody extends StatefulWidget {
  const FilterScreenBody({super.key, required this.location});
  final LocationData location;

  @override
  State<FilterScreenBody> createState() => _FilterScreenBodyState();
}

class _FilterScreenBodyState extends State<FilterScreenBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SearchCubit.get(context).lat = widget.location.latitude;
    SearchCubit.get(context).long = widget.location.longitude;
    SearchCubit.get(context).bath = null;
    SearchCubit.get(context).floor = null;
    SearchCubit.get(context).bed = null;
    SearchCubit.get(context).categoryId = null;
    SearchCubit.get(context).maxPrice = null;
    SearchCubit.get(context).minPrice = null;
    SearchCubit.get(context).minarea = '';
    SearchCubit.get(context).priceDuration = null;
    SearchCubit.get(context).text = '';
    SearchCubit.get(context).maxarea = '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter",
                  style: StylesData.font24Google,
                ),
                const SizedBox(
                  height: 15,
                ),
                const TypeFIltter(),
                const SizedBox(
                  height: 25,
                ),
                const PriceFilter(),
                const SizedBox(
                  height: 25,
                ),
                const PriceDuration(),
                const SizedBox(
                  height: 25,
                ),
                AreaFIltter(location: widget.location),
                const SizedBox(
                  height: 25,
                ),
                const BedRoomFIltter(),
                const SizedBox(
                  height: 25,
                ),
                const BathRoomFIltter(),
                const SizedBox(
                  height: 25,
                ),
                const FloorFIltter(),
                const SizedBox(
                  height: 25,
                ),
                defaultButton(
                    fun: () async {
                      // await SearchCubit.get(context).searchData(
                      //     text: SearchCubit.get(context).text ?? '',
                      //     categoryId: SearchCubit.get(context).categoryId !=
                      //             null
                      //         ? SearchCubit.get(context).categoryId.toString()
                      //         : '',
                      //     minPrice: SearchCubit.get(context).minPrice != null
                      //         ? SearchCubit.get(context).minPrice.toString()
                      //         : '',
                      //     maxPrice: SearchCubit.get(context).maxPrice != null
                      //         ? SearchCubit.get(context).maxPrice.toString()
                      //         : '',
                      //     bed: SearchCubit.get(context).bed != null
                      //         ? SearchCubit.get(context).bed.toString()
                      //         : '',
                      //     floor: SearchCubit.get(context).floor != null
                      //         ? SearchCubit.get(context).floor.toString()
                      //         : '',
                      //     bath: SearchCubit.get(context).bath != null
                      //         ? SearchCubit.get(context).bath.toString()
                      //         : '',
                      //     priceDuration:
                      //         SearchCubit.get(context).priceDuration != null
                      //             ? titles[
                      //                 SearchCubit.get(context).priceDuration!]
                      //             : '',
                      //     minarea: SearchCubit.get(context).minarea != null
                      //         ? SearchCubit.get(context).minarea.toString()
                      //         : '',
                      //     maxarea: SearchCubit.get(context).maxarea != null
                      //         ? SearchCubit.get(context).maxarea.toString()
                      //         : '');

                      Nav(
                          context,
                          HomeView(
                              currentidex: 1,
                              text: SearchCubit.get(context).text ?? '',
                              categoryId:
                                  SearchCubit.get(context).categoryId ?? -1,
                              minPrice: SearchCubit.get(context).minPrice ?? -1,
                              maxPrice: SearchCubit.get(context).maxPrice ?? -1,
                              bed: SearchCubit.get(context).bed ?? -1,
                              floor: SearchCubit.get(context).floor ?? -1,
                              bath: SearchCubit.get(context).bath ?? -1,
                              priceDuration:
                                  SearchCubit.get(context).priceDuration != null
                                      ? SearchCubit.get(context).priceDuration!
                                      : -1,
                              minarea: SearchCubit.get(context).minarea != null
                                  ? SearchCubit.get(context).minarea.toString()
                                  : '',
                              maxarea: SearchCubit.get(context).maxarea != null
                                  ? SearchCubit.get(context).maxarea.toString()
                                  : ''));
                    },
                    textWidget: Text(
                      'Apply filters',
                      style: StylesData.font13,
                    ),
                    height: 54,
                    c: ConstColor.kMainColor),
              ],
            ),
          );
        },
      ),
    );
  }
}

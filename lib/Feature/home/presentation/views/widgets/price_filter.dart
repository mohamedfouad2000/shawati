import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Get%20Max%20Min/get_max_min_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  late SfRangeValues values;

  @override
  void initState() {
    // SearchCubit.get(context).minPrice = 0;
    // SearchCubit.get(context).maxPrice = 10000;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMaxMinCubit(HomeRepoImpl())..getMaxMinPrice(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return BlocConsumer<GetMaxMinCubit, GetMaxMinState>(
            listener: (context, state) {
              if (state is GetMaxSucc) {
                SearchCubit.get(context).minPrice = state.min.toDouble();
                SearchCubit.get(context).maxPrice = state.max.toDouble();
                values =
                    SfRangeValues(state.min.toDouble(), state.max.toDouble());
              }
            },
            builder: (context, state) {
              if (state is GetMaxSucc) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Price",
                            style: StylesData.font16,
                          ),
                        ),
                        Text(
                          "SAR ${SearchCubit.get(context).minPrice.toString().substring(0, 3)} - SAR,${SearchCubit.get(context).maxPrice.toString().substring(0, 4)}",
                          style: StylesData.font13.copyWith(
                              fontWeight: FontWeight.w900,
                              color: ConstColor.kMainColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SfRangeSliderTheme(
                      data: const SfRangeSliderThemeData(
                        overlayColor: Colors.red,
                      ),
                      child: SfRangeSlider(
                        activeColor: ConstColor.kMainColor,
                        inactiveColor: Colors.grey,
                        min: state.min.toDouble(),
                        max: state.max.toDouble(),
                        startThumbIcon: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 11,
                              backgroundColor: ConstColor.kMainColor,
                            ),
                            const CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                        endThumbIcon: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 11,
                              backgroundColor: ConstColor.kMainColor,
                            ),
                            const CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                        values: values,
                        onChanged: (SfRangeValues newValues) {
                          setState(() {
                            values = newValues;
                            SearchCubit.get(context).minPrice = newValues.start;
                            SearchCubit.get(context).maxPrice = newValues.end;
                          });
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is GetMaxError) {
                return Text(state.msg);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Get%20Max%20Min/get_max_min_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawati/generated/l10n.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  late SfRangeValues values;
  TextEditingController mincontroller = TextEditingController();
  TextEditingController maxcontroller = TextEditingController();

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
                mincontroller.text = state.min.toString();

                maxcontroller.text = state.max.toString();
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
                            S.of(context).price,
                            style: StylesData.font16,
                          ),
                        ),
                        Text(
                          "${S.of(context).SAR} ${SearchCubit.get(context).minPrice?.toInt()} - ${S.of(context).SAR} ${SearchCubit.get(context).maxPrice?.toInt()}",
                          style: StylesData.font13.copyWith(
                              fontWeight: FontWeight.w900,
                              color: ConstColor.kMainColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                              height: 45,
                              child: customTextFiled(
                                  controller: mincontroller,
                                  onChanged: (i) {
                                    setState(() {
                                      SearchCubit.get(context).minPrice =
                                          double.tryParse(i) ?? 0;
                                      values = SfRangeValues(
                                          SearchCubit.get(context).minPrice,
                                          SearchCubit.get(context).maxPrice);
                                      setState(() {});
                                    });
                                  },
                                  hintText: S.of(context).min,
                                  type: TextInputType.number)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 20,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: SizedBox(
                              height: 45,
                              child: customTextFiled(
                                  controller: maxcontroller,
                                  onChanged: (i) {
                                    setState(() {
                                      SearchCubit.get(context).maxPrice =
                                          double.tryParse(i) ?? 0;
                                      SfRangeValues(
                                          SearchCubit.get(context).minPrice,
                                          SearchCubit.get(context).maxPrice);
                                      values = SfRangeValues(
                                          SearchCubit.get(context).minPrice,
                                          SearchCubit.get(context).maxPrice);
                                      setState(() {});
                                    });
                                  },
                                  hintText: S.of(context).max,
                                  type: TextInputType.number)),
                        ),
                      ],
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
                            mincontroller.text = '${newValues.start.toInt()}';
                            maxcontroller.text = '${newValues.end.toInt()}';
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

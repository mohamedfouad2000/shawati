import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/price_duration.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/search_widget.dart';

import 'package:flutter/widgets.dart';

import 'package:shawati/Core/utils/styles.dart';

import 'package:shawati/Feature/home/presentation/views/widgets/product_list.dart';
import 'package:shawati/generated/l10n.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(
        'Aha bath${SearchCubit.get(context).bath} bed${SearchCubit.get(context).bed}floor ${SearchCubit.get(context).floor} maxarea${SearchCubit.get(context).maxarea} minarea${SearchCubit.get(context).minarea} maxprice${SearchCubit.get(context).maxPrice} minprice${SearchCubit.get(context).minPrice} priceDuration${titles[SearchCubit.get(context).priceDuration ?? 0]}  text${SearchCubit.get(context).text}');
    SearchCubit.get(context).searchData(
        context: context,
        lat: SearchCubit.get(context).lat ?? -1,
        long: SearchCubit.get(context).long ?? -1,
        text: SearchCubit.get(context).text ?? '',
        categoryId: SearchCubit.get(context).categoryId != -1 && SearchCubit.get(context).categoryId != null
            ? SearchCubit.get(context).categoryId.toString() ?? ''
            : '',
        minPrice: SearchCubit.get(context).minPrice != -1 && SearchCubit.get(context).minPrice != null
            ? SearchCubit.get(context).minPrice.toString() ?? ''
            : '',
        maxPrice: SearchCubit.get(context).maxPrice != -1 && SearchCubit.get(context).maxPrice != null
            ? SearchCubit.get(context).maxPrice.toString() ?? ''
            : '',
        bed: SearchCubit.get(context).bed != -1 && SearchCubit.get(context).bed != null
            ? (SearchCubit.get(context).bed! + 1).toString() ?? ''
            : '',
        floor: SearchCubit.get(context).floor != -1 && SearchCubit.get(context).floor != null
            ? (SearchCubit.get(context).floor! + 1).toString() ?? ''
            : '',
        bath: SearchCubit.get(context).bath != -1 && SearchCubit.get(context).bath != null
            ? (SearchCubit.get(context).bath! + 1).toString() ?? ''
            : '',
        priceDuration: SearchCubit.get(context).priceDuration != -1 &&
                SearchCubit.get(context).priceDuration != null
            ? titles[SearchCubit.get(context).priceDuration!] ?? ''
            : '',
        maxarea: SearchCubit.get(context).maxarea != -1 && SearchCubit.get(context).maxarea != null
            ? SearchCubit.get(context).maxarea.toString() ?? ''
            : '',
        minarea: SearchCubit.get(context).minarea != -1 && SearchCubit.get(context).minarea != null ? SearchCubit.get(context).minarea.toString() ?? '' : '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 16.0, right: 16, top: 32, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(
                searchController: searchController,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                S.of(context).Recentlysearch,
                style: StylesData.font16raleway,
              ),
              // if (!data)
              // Expanded(
              //   child: ListView.builder(
              //       itemCount: 3,
              //       itemBuilder: (itemcontext, index) => Padding(
              //             padding: const EdgeInsets.symmetric(vertical: 5),
              //             child: InkWell(
              //               onTap: () {
              //                 setState(() {
              //                   data = true;
              //                 });
              //               },
              //               child: Row(
              //                 children: [
              //                   Icon(
              //                     Icons.access_time,
              //                     color: ConstColor.kMainColor,
              //                   ),
              //                   const SizedBox(
              //                     width: 6,
              //                   ),
              //                   const Expanded(child: Text("Houses")),
              //                   const ImageIcon(
              //                     AssetImage(
              //                       AssetsData.arrow,
              //                     ),
              //                     color: Colors.grey,
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           )),
              // ),

              // if (data)
              const productList(),
            ],
          ),
        );
      },
    );
  }
}

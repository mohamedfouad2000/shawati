import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Core/widgets/custom_loading_widget.dart';
import 'package:shawati/Core/widgets/loading/metting_loading.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';

import 'package:shawati/Feature/home/presentation/views/widgets/home_search_widget.dart';
import 'package:shawati/generated/l10n.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    super.key,
    required this.searchController,
  });
  final TextEditingController searchController;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int? currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCategoryCubit, GetCategoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetCategorySucc) {
          return Column(
            children: [
              HomeSearchWidget(searchController: widget.searchController),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    categoryItem(
                        catNameAr: 'الكل' ?? '',
                        catName: 'All' ?? '',
                        id: -1,
                        image: AssetsData.all,
                        context: context),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return categoryItem(
                              catNameAr:
                                  state.list[index].brandNameAr.toString() ??
                                      '',
                              catName:
                                  state.list[index].brandName.toString() ?? '',
                              id: state.list[index].id ?? 0,
                              image: state.list[index].image.toString() ?? '',
                              context: context);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemCount: state.list.length ?? 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is GetCategoryError) {
          return const SizedBox();
        } else {
          return const CustomLoadingWidget(child: CategoryLoadScreen());
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
        }
      },
    );
    //  Row(
    //   children: [
    //     // categoryItem(image: AssetsData.all, context: context),
    //     // const SizedBox(
    //     //   width: 10,
    //     // ),
    //     // categoryItem(image: AssetsData.c1, context: context),
    //     // const SizedBox(
    //     //   width: 10,
    //     // ),
    //     // categoryItem(image: AssetsData.c2, context: context),
    //     // const SizedBox(
    //     //   width: 10,
    //     // ),
    //     // categoryItem(image: AssetsData.c3, context: context),
    //     // const SizedBox(
    //     //   width: 10,
    //     // ),
    //     // categoryItem(image: AssetsData.c4, context: context),
    //   ],
    // ),
    // ;
  }

  Widget categoryItem(
      {required String image,
      required context,
      required int id,
      required String catName,
      required String catNameAr}) {
    return InkWell(
      onTap: () {
        BlocProvider.of<HomeCubit>(context)
            .getHomeData(cateId: id, text: '', context: context);

        setState(() {
          currentIndex = id;
        });
        // NavegatorPush(
        //     context,
        //     ApartmentsScreen(
        //         catId: id, catName: catName, catNameAr: catNameAr));
      },
      child: Opacity(
        opacity: currentIndex == id ? 1 : .5,
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      currentIndex == id ? ConstColor.kMainColor : Colors.grey,
                  width: 1.4),
              borderRadius: const BorderRadius.all(
                Radius.circular(13),
              )),
          child: id == -1
              ? Center(
                  child: Text(
                    S.of(context).All,
                    style: StylesData.font18.copyWith(color: Colors.black),
                  ),
                )
              : CachedImage(
                  '$xURLIMAGE$image',
                  height: 20,
                  width: 20,
                ),
        ),
      ),
    );
  }
}

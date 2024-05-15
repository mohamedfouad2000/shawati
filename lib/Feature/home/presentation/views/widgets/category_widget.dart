import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/widgets/custom_loading_widget.dart';
import 'package:shawati/Core/widgets/loading/metting_loading.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawati/Feature/home/presentation/views/screens/apartments_screen.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/home_search_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.searchController,
  });
  final TextEditingController searchController;
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
              HomeSearchWidget(searchController: searchController),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return categoryItem(
                        catNameAr:
                            state.list[index].brandNameAr.toString() ?? '',
                        catName: state.list[index].brandName.toString() ?? '',
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
          );
        } else if (state is GetCategoryError) {
          return Text(state.msg);
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
        NavegatorPush(
            context,
            ApartmentsScreen(
                catId: id, catName: catName, catNameAr: catNameAr));
      },
      child: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: .7),
            borderRadius: const BorderRadius.all(
              Radius.circular(13),
            )),
        child: CachedImage(
          '$xURLIMAGE$image',
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}

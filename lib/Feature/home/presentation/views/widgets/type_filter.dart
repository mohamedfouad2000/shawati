import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/generated/l10n.dart';

class TypeFIltter extends StatefulWidget {
  const TypeFIltter({
    super.key,
  });

  @override
  State<TypeFIltter> createState() => _TypeFIltterState();
}

class _TypeFIltterState extends State<TypeFIltter> {
  // int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCategoryCubit(HomeRepoImpl())..getCategory(),
      child: BlocConsumer<GetCategoryCubit, GetCategoryState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is GetCategorySucc) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).Type,
                  style: StylesData.font16,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return typeItem(
                          name: state.list[index].brandName ?? '',
                          nameAr: state.list[index].brandNameAr ?? '',
                          index: state.list[index].id ?? 0);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: state.list.length,
                  ),
                ),
              ],
            );
          } else if (state is GetCategoryError) {
            return Text(state.msg);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget typeItem(
      {required String name, required int index, required String nameAr}) {
    return InkWell(
      onTap: () {
        setState(() {
          print(index);
          SearchCubit.get(context).categoryId = index;
          // currentIndex = index;
          // print(currentIndex);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: SearchCubit.get(context).categoryId == index
                ? ConstColor.kMainColor
                : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade300)),
        child: Center(
          child: Text(
            LocalizationCubit.get(context).isArabic() ? nameAr : name,
            style: StylesData.font17.copyWith(
                fontSize: 15,
                color: SearchCubit.get(context).categoryId == index
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}

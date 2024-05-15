import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';

import 'package:shawati/Feature/home/presentation/views/widgets/apartment_title.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/home_search_widget.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_category_list.dart';

class ApartmentsScreenBody extends StatefulWidget {
  const ApartmentsScreenBody(
      {super.key,
      required this.catId,
      required this.catName,
      required this.catNameAr});
  final int catId;
  final String catName;
  final String catNameAr;

  @override
  State<ApartmentsScreenBody> createState() => _ApartmentsScreenBodyState();
}

class _ApartmentsScreenBodyState extends State<ApartmentsScreenBody> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl())
        ..getHomeData(cateId: widget.catId, text: '', context: context),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ApartMentTitle(
                catName: widget.catName,
                catNameAr: widget.catNameAr,
              ),
              const SizedBox(
                height: 10,
              ),
              HomeSearchWidget(
                  searchController: searchController, cateId: widget.catId),
              const SizedBox(
                height: 10,
              ),
              ProductCategoryList(
                catId: widget.catId,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

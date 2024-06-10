import 'package:custom_calendar_viewer/custom_calendar_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/profile%20cubit/profile_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/category_widget.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/home_search_widget.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_iteam_widget.dart';
import 'package:shawati/test.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(TOKEN);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(HomeRepoImpl())
            ..getHomeData(cateId: -1, text: '', context: context),
        ),
        BlocProvider(
          create: (context) => GetCategoryCubit(HomeRepoImpl())..getCategory(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<HomeCubit>(context)
                  .getHomeData(cateId: -1, text: '', context: context);

              BlocProvider.of<GetCategoryCubit>(context).getCategory();

              BlocProvider.of<ProfileCubit>(context).getProfileData();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16, top: 16, bottom: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomHomeAppBar(),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const testMan(),
                    const SizedBox(
                      height: 10,
                    ),
                    CategoryWidget(
                      searchController: searchController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ProductItem(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

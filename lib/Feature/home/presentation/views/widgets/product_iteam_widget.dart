import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/widgets/custom_loading_widget.dart';
import 'package:shawati/Core/widgets/empty_wid.dart';
import 'package:shawati/Core/widgets/faliure_wid.dart';
import 'package:shawati/Core/widgets/loading/home_lead_loading.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/allproduct_widget.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_data.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeSucc) {
          if (state.model.data!.services!.isEmpty) {
            return const Center(
              child: EmptyWidget(),
            );
          }
          return Column(
            children: [
              AllProducts(services: state.model.data!.services!),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ProductData(
                      title: state.model.data?.services?[index].name ?? '',
                      subTitle: state.model.data?.services?[index].place ?? '',
                      image: state.model.data?.services?[index].image ?? '',
                      subTitlearab:
                          state.model.data?.services?[index].place ?? '',
                      titlearab:
                          state.model.data?.services?[index].nameAr ?? '',
                      money:
                          state.model.data?.services?[index].priceWithCommission.toString() ??
                              '');
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: state.model.data?.services?.length ?? 0,
              ),
            ],
          );
        } else if (state is HomeError) {
          return const Center(child: FailureWidget());
        } else {
          return const CustomLoadingWidget(child: HomeLeadLoading());
        }
      },
    );
  }
}

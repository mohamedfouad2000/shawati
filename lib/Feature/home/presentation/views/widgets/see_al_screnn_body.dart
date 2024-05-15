import 'package:flutter/material.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_data.dart';

class SeeAllScreenBody extends StatelessWidget {
  const SeeAllScreenBody({super.key, required this.services});
  final List<Service> services;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return ProductData(
                title: services[index].name ?? '',
                subTitle: services[index].place ?? '',
                image: services[index].image ?? '',
                subTitlearab: services[index].place ?? '',
                titlearab: services[index].nameAr ?? '',
                money: services[index].priceWithCommission.toString() ?? '');
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: services.length ?? 0,
        ));
  }
}

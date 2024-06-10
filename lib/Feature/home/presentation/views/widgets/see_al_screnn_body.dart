import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/presentation/views/screens/product_details_screen.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_data.dart';

class SeeAllScreenBody extends StatelessWidget {
  const SeeAllScreenBody(
      {super.key, required this.services, required this.contactDetails});
  final List<Service> services;
  final ContactDetails contactDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                NavegatorPush(
                    context,
                    ProductDetailsScreen(
                        model: services[index] ?? Service(),
                        owner: contactDetails ?? ContactDetails()));
              },
              child: ProductData(
                  gallary: services[index].gallery ?? [],
                  id: services[index].id ?? 0,
                  title: services[index].name ?? '',
                  subTitle: services[index].place ?? '',
                  image: services[index].image ?? '',
                  subTitlearab: services[index].placeAr ?? '',
                  titlearab: services[index].nameAr ?? '',
                  money: services[index].regularPrice.toString() ?? ''),
            );
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

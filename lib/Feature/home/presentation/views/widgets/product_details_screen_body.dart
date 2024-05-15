import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latlong2/latlong.dart';

import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/presentation/views/screens/schedule_screen.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/map_widget.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/owner_product.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_image.dart';
import 'package:shawati/generated/l10n.dart';

// import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody(
      {super.key, required this.model, required this.owner});
  final Service model;
  final ContactDetails owner;
  @override
  Widget build(BuildContext context) {
    print("aha ${model.lat} ${model.lng}");

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(
                image: model.image ?? '',
                name: model.name ?? '',
                nameAr: model.nameAr ?? '',
                place: model.place ?? '',
                rate: model.rate ?? 5,
                bed: model.bed ?? 0,
                bath: model.bath ?? 0,
                floor: model.floor ?? 0,
                price: model.priceWithCommission ?? 0),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).AboutApartment,
              style: StylesData.font24Google.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              model.description ?? '',
              style: StylesData.font11.copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              S.of(context).LestingAgent,
              style: StylesData.font24Google.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            OwnerProduct(owner: owner),
            const SizedBox(
              height: 8,
            ),
            CalendarDetails(
              fromdate: '${model.days}',
              todate: '${model.days}',
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 300,
              child: MapFlutter(
                latLng: LatLng(
                    model.lat != '' && model.lat != 'null' && model.lat != null
                        ? double.parse(model.lat.toString())
                        : 0,
                    model.lng != '' && model.lng != 'null' && model.lng != null
                        ? double.parse(model.lng.toString())
                        : 0),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            defaultButton(
                fun: () {
                  NavegatorPush(
                      context,
                      ScheduleScreen(
                        id: model.id!,
                        days: model.days.toString(),
                      ));
                },
                textWidget: Text(
                  S.of(context).Applyfilters,
                  style: StylesData.font13,
                ),
                height: 54,
                c: ConstColor.kMainColor),
          ],
        ),
      ),
    );
  }
}

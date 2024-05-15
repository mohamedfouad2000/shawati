import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/booking_product.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/map_widget.dart';

class BookingDetailsScreenBody extends StatelessWidget {
  const BookingDetailsScreenBody({super.key, required this.model});
  final Service model;
  @override
  Widget build(BuildContext context) {
    print('opop');
    print(model.lat.toString());
    print(model.lng.toString());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BookingProduct(
                name: model.name ?? '',
                place: model.place ?? '',
                bed: model.bed.toString(),
                bath: model.bath.toString(),
                floor: model.floor.toString(),
                clockin: model.days ?? '',
                clockout: model.days ?? '',
                price: model.priceWithCommission.toString(),
                image: model.image ?? ''),
            const SizedBox(
              height: 15,
            ),
            // const BookingPaymentMethod(),
            // const SizedBox(
            //   height: 15,
            // ),
            CalendarDetails(
              fromdate: model.days ?? '',
              todate: model.days ?? '',
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 300,
              child: MapFlutter(
                latLng: LatLng(
                    model.lat != '' ? double.parse(model.lat.toString()) : 0,
                    model.lng != '' ? double.parse(model.lng.toString()) : 0),
              ),
            ),
            // defaultButton(
            //     fun: () {
            //       showRatingDialog(context: context, id: model.id ?? 0);
            //     },
            //     textWidget: const Text("Add Rating"),
            //     c: Colors.yellow)
          ],
        ),
      ),
    );
  }
}

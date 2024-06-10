import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/booking_details_screen_body.dart';
import 'package:shawati/generated/l10n.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen(
      {super.key,
      required this.model,
      this.attachment,
      required this.bookingStatusId,
      required this.bookingid,
      required this.startTime,
      required this.endTime,
      required this.id,
      required this.paymentStatusId});
  final Service model;
  final String? attachment;
  final int bookingStatusId;
  final int bookingid;
  final String startTime;
  final String endTime;
  final int id;
  final int paymentStatusId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          title: InkWell(
            onTap: () {
              print('widget model lat $startTime $endTime');
              showRatingDialog(context: context, id: model.id ?? 0);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: ConstColor.kMainColor)),
              child: Text(
                S.of(context).AddRating,
                style: StylesData.font20.copyWith(fontSize: 18),
              ),
            ),
          )),
      body: BookingDetailsScreenBody(
          endTime: endTime,
          paymentStatusId: paymentStatusId,
          id: id,
          startTime: startTime,
          model: model,
          attachment: attachment,
          bookingid: bookingid,
          bookingStatusId: bookingStatusId),
    );
  }
}

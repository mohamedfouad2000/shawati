import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/payment_screen_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    super.key,
    required this.bookingId,
    required this.serid,
    required this.startAt,
    required this.endAt,
    required this.attachment,
    required this.coupon,
  });
  final int bookingId;
  final int serid;
  final String coupon;
  final String startAt;
  final String endAt;
  final String attachment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context),
        body: PaymentScreenBody(
          bookingId: bookingId,
          coupon: coupon,
          serid: serid,
          startAt: startAt,
          endAt: endAt,
          attachment: attachment,
        ));
  }
}

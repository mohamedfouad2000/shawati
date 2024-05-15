import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/payment_screen_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen(
      {super.key, required this.id, required this.start, required this.end});
  final int id;
  final String start;
  final String end;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: PaymentScreenBody(
        id: id,
        start: start,
        end: end,
      ),
    );
  }
}

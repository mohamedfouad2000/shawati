import 'package:flutter/material.dart';

import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';

import 'package:shawati/Core/utils/styles.dart';

import 'package:shawati/Feature/home/presentation/views/widgets/amount_payment.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/pay_now.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/payment_method.dart';

class PaymentScreenBody extends StatelessWidget {
  const PaymentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment",
            style: StylesData.font24Google,
          ),
          const SizedBox(
            height: 20,
          ),
          const PaymentMethod(),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey.shade300,
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: AmountPayment()),
          const SizedBox(
            height: 20,
          ),
          defaultButton(
              fun: () {
                showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    showDragHandle: true,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0)),
                    ),
                    builder: (BuildContext context) {
                      return const PayNowSheet();
                      // return your layout
                    });
              },
              textWidget: Text(
                'Pay now',
                style: StylesData.font13,
              ),
              height: 54,
              c: ConstColor.kMainColor),
        ],
      ),
    );
  }
}

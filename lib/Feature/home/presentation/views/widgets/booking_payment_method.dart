import 'package:flutter/cupertino.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';

class BookingPaymentMethod extends StatelessWidget {
  const BookingPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Method",
          style: StylesData.font14,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Online Payment",
          style: StylesData.font10Rubik.copyWith(
              fontWeight: FontWeight.w300, color: const Color(0xff3B3B3B)),
        ),
        Row(
          children: [
            Text(
              "Offline Status: ",
              style: StylesData.font12Rubik.copyWith(),
            ),
            Text(
              "paid",
              style: StylesData.font12Rubik.copyWith(
                  color: ConstColor.kMainColor, fontWeight: FontWeight.w300),
            )
          ],
        ),
        Text(
          "Total Amount: SAR 160.00",
          style: StylesData.font12Rubik,
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:shawati/Core/utils/styles.dart';

class AmountPayment extends StatelessWidget {
  const AmountPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Amount",
          style: StylesData.font18,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              "Fee:",
              style: StylesData.font11.copyWith(color: const Color(0xff7A7A7A)),
            )),
            Text(
              "SAR 10.00",
              style: StylesData.font11.copyWith(
                  color: const Color(0xff222B45), fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              "Total:",
              style: StylesData.font11.copyWith(color: const Color(0xff7A7A7A)),
            )),
            Text(
              "SAR 160.30",
              style: StylesData.font11.copyWith(
                  color: const Color(0xff222B45), fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }
}

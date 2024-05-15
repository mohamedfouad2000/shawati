import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shawati/generated/l10n.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(S.of(context).NoData),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: Center(
            child: Lottie.asset(
              'assets/images/empty2.json',
            ),
          ),
        ),
      ],
    );
  }
}

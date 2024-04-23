import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';

class ApartMentTitle extends StatelessWidget {
  const ApartMentTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          "Apartments",
          style: StylesData.font18,
        )),
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Showing ",
                style: StylesData.font12.copyWith(color: Colors.black),
              ),
              Text(
                "263 home",
                style: StylesData.font12.copyWith(color: ConstColor.kMainColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}

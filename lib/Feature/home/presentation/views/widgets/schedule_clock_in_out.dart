import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';

class ScheduleClockInOut extends StatelessWidget {
  const ScheduleClockInOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            // color: const Color(0xffE9F0FF),
            borderRadius: BorderRadius.circular(23),
            // color: const Color(0xffE9F0FF),
            border: Border.all(color: ConstColor.kMainColor),
          ),
          child: Row(
            children: [
              const ImageIcon(
                AssetImage(
                  AssetsData.note,
                ),
              ),
              Expanded(
                child: Text(
                  " check in",
                  style: StylesData.font13.copyWith(color: Colors.black),
                ),
              ),
              Text(
                "Aug 1 monday",
                style: StylesData.font13.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            // color: const Color(0xffE9F0FF),
            borderRadius: BorderRadius.circular(23),
            // color: const Color(0xffE9F0FF),
            border: Border.all(color: ConstColor.kMainColor),
          ),
          child: Row(
            children: [
              ImageIcon(
                const AssetImage(
                  AssetsData.clock,
                ),
                color: ConstColor.kMainColor,
              ),
              Expanded(
                child: Text(
                  " check out",
                  style: StylesData.font13.copyWith(color: Colors.black),
                ),
              ),
              Text(
                "Aug 9 monday",
                style: StylesData.font13.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

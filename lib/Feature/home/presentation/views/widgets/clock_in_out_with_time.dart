import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';

class ClockInOutWithTime extends StatelessWidget {
  const ClockInOutWithTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ImageIcon(
                    const AssetImage(
                      AssetsData.note,
                    ),
                    color: ConstColor.kMainColor,
                    size: 15,
                  ),
                  Text(
                    " check in",
                    style: StylesData.font9.copyWith(
                        color: const Color(0xffABABAB),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "1 Aug 24, 11:00 am",
                style: StylesData.font11.copyWith(color: Colors.black),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                ImageIcon(
                  const AssetImage(
                    AssetsData.clock,
                  ),
                  color: ConstColor.kMainColor,
                  size: 15,
                ),
                Text(
                  " check out",
                  style: StylesData.font9.copyWith(
                      color: const Color(0xffABABAB),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "1 Aug 24, 11:00 am",
              style: StylesData.font11.copyWith(color: Colors.black),
            )
          ],
        )
      ],
    );
  }
}

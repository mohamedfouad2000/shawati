import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';

class ScheduleRange extends StatelessWidget {
  const ScheduleRange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffE9F0FF),
        border: Border.all(color: ConstColor.kMainColor),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "CHECK IN",
                  style: StylesData.font12
                      .copyWith(color: const Color(0xff717784)),
                ),
                Text(
                  "Aug 1",
                  style: StylesData.font24Google,
                ),
                Text(
                  "Monday",
                  style: StylesData.font14,
                ),
              ],
            ),
          ),
          const Image(
            width: 60,
            image: AssetImage(
              AssetsData.line,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "CHECK Out",
                  style: StylesData.font12
                      .copyWith(color: const Color(0xff717784)),
                ),
                Text(
                  "Aug 1",
                  style: StylesData.font24Google,
                ),
                Text(
                  "Monday",
                  style: StylesData.font14,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

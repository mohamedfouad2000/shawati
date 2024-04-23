import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  SfRangeValues values = const SfRangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Price",
                style: StylesData.font16,
              ),
            ),
            Text(
              "SAR 200 - SAR,1000",
              style: StylesData.font13.copyWith(
                  fontWeight: FontWeight.w900, color: ConstColor.kMainColor),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SfRangeSliderTheme(
          data: const SfRangeSliderThemeData(
            overlayColor: Colors.red,
          ),
          child: SfRangeSlider(
            activeColor: ConstColor.kMainColor,
            inactiveColor: Colors.grey,
            min: 0,
            max: 100,
            startThumbIcon: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 11,
                  backgroundColor: ConstColor.kMainColor,
                ),
                const CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            endThumbIcon: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 11,
                  backgroundColor: ConstColor.kMainColor,
                ),
                const CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            values: values,
            onChanged: (SfRangeValues newValues) {
              setState(() {
                values = newValues;
              });
            },
          ),
        ),
      ],
    );
  }
}

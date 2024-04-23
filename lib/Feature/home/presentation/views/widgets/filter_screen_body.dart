import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/area_filter.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/bath_room.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/bed_room.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/floor.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/price_duration.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/price_filter.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/type_filter.dart';

// import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterScreenBody extends StatefulWidget {
  const FilterScreenBody({super.key});

  @override
  State<FilterScreenBody> createState() => _FilterScreenBodyState();
}

class _FilterScreenBodyState extends State<FilterScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Filter",
              style: StylesData.font24Google,
            ),
            const SizedBox(
              height: 15,
            ),
            const TypeFIltter(),
            const SizedBox(
              height: 25,
            ),
            const PriceFilter(),
            const SizedBox(
              height: 25,
            ),
            const PriceDuration(),
            const SizedBox(
              height: 25,
            ),
            const AreaFIltter(),
            const SizedBox(
              height: 25,
            ),
            const BedRoomFIltter(),
            const SizedBox(
              height: 25,
            ),
            const BathRoomFIltter(),
            const SizedBox(
              height: 25,
            ),
            const FloorFIltter(),
            const SizedBox(
              height: 25,
            ),
            defaultButton(
                fun: () {
                  Navigator.pop(context);
                },
                textWidget: Text(
                  'Apply filters',
                  style: StylesData.font13,
                ),
                height: 54,
                c: ConstColor.kMainColor),
          ],
        ),
      ),
    );
  }
}

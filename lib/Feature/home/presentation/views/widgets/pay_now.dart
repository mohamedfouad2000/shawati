import 'package:flutter/material.dart';

import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/size_config.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/clock_in_out_with_time.dart';

class PayNowSheet extends StatelessWidget {
  const PayNowSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * .6,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Image(
                image: AssetImage(
                  AssetsData.confirmImage,
                ),
                height: 120,
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "Property booking confirmed",
                  style: StylesData.font24Google,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ClockInOutWithTime(
                clockin: "10:00 AM",
                clockout: "11:00 AM",
              ),
              const SizedBox(
                height: 20,
              ),
              defaultButton(
                  fun: () {
                    NavegatorPush(context, const HomeView(currentidex: 2));
                    // NavegatorPush(context, const ScheduleScreen());
                  },
                  textWidget: Text(
                    'View booking',
                    style: StylesData.font13,
                  ),
                  height: 54,
                  c: ConstColor.kMainColor),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Nav(
                      context,
                      const HomeView(
                        currentidex: 0,
                      ));
                },
                child: Text(
                  "back Home",
                  style: StylesData.font14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

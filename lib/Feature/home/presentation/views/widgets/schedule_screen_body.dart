import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/screens/payment_screen.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/date_time_range.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/schedule_clock_in_out.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/schedule_range.dart';

class ScheduleScreenBody extends StatelessWidget {
  const ScheduleScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "schedule",
            style: StylesData.font24Google,
          ),
          const SizedBox(
            height: 20,
          ),
          const ScheduleRange(),
          const SizedBox(
            height: 18,
          ),
          const ScheduleClockInOut(),
          const SizedBox(
            height: 20,
          ),
          const DateTimeSchedleRange(),
          const SizedBox(
            height: 10,
          ),
          defaultButton(
              fun: () {
                NavegatorPush(context, const PaymentScreen());
              },
              textWidget: Text(
                'Confirm',
                style: StylesData.font13,
              ),
              height: 54,
              c: ConstColor.kMainColor),
        ],
      ),
    );
  }
}
